//
//  HomeViewController.swift
//  DYZB
//
//  Created by ios on 05/08/2019.
//  Copyright © 2019 zcw. All rights reserved.
//

import UIKit

private let kPageTitleViewH = 40.0

class HomeViewController: UIViewController, PageTitleViewDelegate, PageContentViewDelegate {
    
    private lazy var pageTitleView: PageTitleView = {
        
        let frame = CGRect(x: 0.0, y: K_NavHeight, width: Double(K_ScreenWidth), height: kPageTitleViewH)
        let pageTitleView = PageTitleView(frame: frame, titles: ["推荐", "游戏", "娱乐", "趣玩"])
        pageTitleView.delegate = self
        
        return pageTitleView
    }()
    
    private lazy var pageControllView: PageContentView = {[weak self] in
       
        let frame = CGRect(x: 0.0, y: K_NavHeight + kPageTitleViewH, width: Double(K_ScreenWidth), height: Double(K_ScreenHeight) - K_NavHeight - kPageTitleViewH - K_BarHeight)
        
        var childsVC = [UIViewController]()
        childsVC.append(RecommendViewController())
        for _ in 0..<3 {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            childsVC.append(vc)
        }
        
        let pageControllView = PageContentView(frame: frame, childsVC: childsVC, parentVC: self)
        pageControllView.delegate = self
        
        return pageControllView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupUI()
    }
    
    

}

// MARK: 界面布局
extension HomeViewController {
    
    private func setupUI() {
     
        navigationController?.navigationBar.isTranslucent = true
        setupNavigationBar()
        view.backgroundColor = UIColor.white
        view.addSubview(pageTitleView)
        view.addSubview(pageControllView)
    }
    
    private func setupNavigationBar() {
        // logo
        navigationItem.leftBarButtonItem = UIBarButtonItem(itemImage: "logo")
        
        // 右侧btn
        let size = CGSize(width: 40, height: 40)

        let historyItem = UIBarButtonItem(itemImage: "image_my_history", highlightedImage: "Image_my_history_click", size: size)
        
        let searchItem = UIBarButtonItem(itemImage: "btn_search", highlightedImage: "btn_search_clicked", size: size)
        
        let qrcodeItem = UIBarButtonItem(itemImage: "Image_scan", highlightedImage: "Image_scan_click", size: size)
        
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
    }
}

// MARK: pageTitleView Delegate
extension HomeViewController {
    
    func pageTitleView(titleView: PageTitleView, selectedIndex index: Int) {
        pageControllView.setCurrentIndex(currentIndex: index)
    }
}

// MARK: PageContentView Delegate
extension HomeViewController {
    
    func pageContentView(PageContentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setupTitleWithProgress(progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}
