//
//  RecommendViewController.swift
//  DYZB
//
//  Created by ios on 06/08/2019.
//  Copyright © 2019 zcw. All rights reserved.
//

import UIKit

private let kItemMargin = 10.0
private let kItemWidth = (K_ScreenWidth - 10 * 3) / 2.0
private let kItemHeight = kItemWidth * 3 / 4.0
private let kHeaderHeight: CGFloat = 50

private let kNormalCellId = "normalCell"
private let kGirlsCellId = "girlsCell"
private let kHeaderViewId = "haderView"

class RecommendViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    lazy var collectionView: UICollectionView = {[weak self] in
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemWidth, height: kItemHeight)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = CGFloat(kItemMargin)
        layout.headerReferenceSize = CGSize(width: K_ScreenWidth, height: kHeaderHeight)
        layout.sectionInset = UIEdgeInsets(top: 0, left: CGFloat(kItemMargin), bottom: 0, right: CGFloat(kItemMargin))
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: Double(K_ScreenWidth), height: Double(K_ScreenHeight) - K_BarHeight - K_NavHeight - 40), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "CollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: kNormalCellId)
        collectionView.register(UINib(nibName: "CollectionGirlsCell", bundle: nil), forCellWithReuseIdentifier: kGirlsCellId)
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: kHeaderViewId)
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
    }
}

// MARK: 页面布局
extension RecommendViewController {
    
    private func setupUI() {
        
        view.backgroundColor = UIColor.white
        view.addSubview(collectionView)
    }
}

// MARK: collectionView delegate
extension RecommendViewController {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 8
        }
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGirlsCellId, for: indexPath)

            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellId, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 3 {
            return CGSize(width: kItemWidth, height: kItemWidth * 4 / 3)
        }
        
        return CGSize(width: kItemWidth, height: kItemWidth * 3 / 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: kHeaderViewId, for: indexPath) as! CollectionHeaderView
        
        return headerView
    }
}
