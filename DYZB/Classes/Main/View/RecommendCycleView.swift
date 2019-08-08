//
//  RecommendCycleView.swift
//  DYZB
//
//  Created by 张昌伟 on 2019/8/7.
//  Copyright © 2019 zcw. All rights reserved.
//

import UIKit

let kCycleCellId = "cycleCell"


class RecommendCycleView: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    lazy var data = [AnchorGroup]()
    lazy var recommendModel: RecommendViewModel = RecommendViewModel()
    
    
    override func awakeFromNib() {
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: K_ScreenWidth, height: K_ScreenWidth * 3 / 8 - 1)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kCycleCellId)
        
        recommendModel.requestCycleData { (result) in
            self.data = result
            self.collectionView.reloadData()
            self.pageControl.numberOfPages = self.data.count
        }
    }
}

// MARK: 初始化方法
extension RecommendCycleView {
    
    
    /// 初始化
    ///
    /// - Returns: RecommendCycleView
    class func recommendCycleView() -> RecommendCycleView {
        
        return Bundle.main.loadNibNamed("RecommendCycleView", owner: nil, options: nil)?.first as! RecommendCycleView
    }
}

// MARK: collectionView delegate
extension RecommendCycleView {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCycleCellId, for: indexPath)
        cell.backgroundColor = indexPath.item % 2 == 0 ? UIColor.red : UIColor.blue
        let imageView = UIImageView(frame: cell.contentView.bounds)
        cell.addSubview(imageView)
        
        let anchorGroup = data[indexPath.item]
        
        imageView.kf.setImage(with: URL(string: anchorGroup.pic_url ?? ""))
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let index = scrollView.contentOffset.x / K_ScreenWidth
        
        pageControl.currentPage = Int(index)
    }
}

