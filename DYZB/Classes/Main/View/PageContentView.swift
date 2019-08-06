//
//  PageContentView.swift
//  DYZB
//
//  Created by 张昌伟 on 2019/8/5.
//  Copyright © 2019 zcw. All rights reserved.
//

import UIKit

private let cellID = "pageCell"

protocol PageContentViewDelegate: class {
    func pageContentView(PageContentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int)
}

class PageContentView: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private let childsVC: [UIViewController]
    private weak var parentVC: UIViewController?
    private var startOffsetX: CGFloat = 0
    private var endOffsetX: CGFloat = 0
    private var isForbidScrollDelegate: Bool = false
    weak var delegate: PageContentViewDelegate?
    
    private lazy var collectionView: UICollectionView = {[weak self] in
       
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = (self?.bounds.size)!
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: (self?.bounds)!, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = true
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        
        return collectionView
    }()

    init(frame: CGRect, childsVC: [UIViewController], parentVC: UIViewController?) {
        
        self.childsVC = childsVC
        self.parentVC = parentVC
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: 页面布局
extension PageContentView {
    
    private func setupUI() {
        
        // 将子控制器添加到父控制器
        for childVC in childsVC {
            parentVC?.addChild(childVC)
        }
        
        // 添加collectionView
        addSubview(collectionView)
    }
}

// MARK: collectionView delegate
extension PageContentView {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childsVC.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        
        let childVC = childsVC[indexPath.item]
        childVC.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVC.view)
    
        return cell
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        startOffsetX = scrollView.contentOffset.x
        isForbidScrollDelegate = false
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if isForbidScrollDelegate {
            return
        }
        
        // 需要的数据
        var progress: CGFloat = 0
        var sourceIndex: Int = 0
        var targetIndex: Int = 0
        
        // 判断左滑or右滑
        let currentOffsetX = scrollView.contentOffset.x
        if currentOffsetX > startOffsetX {
            // 左滑
            progress = currentOffsetX / K_ScreenWidth - CGFloat(floor(Float(currentOffsetX / K_ScreenWidth)))
            sourceIndex = Int(currentOffsetX / K_ScreenWidth)
            targetIndex = sourceIndex + 1
            if targetIndex >= childsVC.count {
                targetIndex = childsVC.count - 1
            }
            if currentOffsetX - startOffsetX == K_ScreenWidth {
                progress = 1.0
                targetIndex = sourceIndex
            }
        } else {
            // 右滑
            progress = 1 - (currentOffsetX / K_ScreenWidth - CGFloat(floor(Float(currentOffsetX / K_ScreenWidth))))
            targetIndex = Int(currentOffsetX / K_ScreenWidth)
            sourceIndex = targetIndex + 1
            if sourceIndex >= childsVC.count {
                sourceIndex = childsVC.count - 1
            }
            if currentOffsetX < 0 {

                sourceIndex = targetIndex
            }
        }
//        print("progress\(progress)   sourceIndex\(sourceIndex)     targetIndex\(targetIndex)")
        delegate?.pageContentView(PageContentView: self, progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}

// MARK: 暴露方法
extension PageContentView {

    func setCurrentIndex(currentIndex: Int) {
        
        isForbidScrollDelegate = true
        let currentPoint = CGPoint(x: Double(currentIndex) * Double(K_ScreenWidth), y: 0)
        
        collectionView.setContentOffset(currentPoint, animated: true)
    }
}
