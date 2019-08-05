//
//  HomeViewController.swift
//  DYZB
//
//  Created by ios on 05/08/2019.
//  Copyright © 2019 zcw. All rights reserved.
//

import UIKit

private let kPageTitleViewH = 40.0

class HomeViewController: UIViewController {
    
    private lazy var pageTitleView: PageTitleView = {
        
        let frame = CGRect(x: 0.0, y: K_NavHeight, width: Double(K_ScreenWidth), height: kPageTitleViewH)
        let pageTitleView = PageTitleView(frame: frame, titles: ["推荐", "游戏", "娱乐", "趣玩"])
        
        return pageTitleView
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
        view.addSubview(pageTitleView)
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
