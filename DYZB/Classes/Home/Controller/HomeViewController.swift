//
//  HomeViewController.swift
//  DYZB
//
//  Created by ios on 05/08/2019.
//  Copyright © 2019 zcw. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupUI()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: 界面布局
extension HomeViewController {
    
    private func setupUI() {
     
        setupNavigationBar()
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
