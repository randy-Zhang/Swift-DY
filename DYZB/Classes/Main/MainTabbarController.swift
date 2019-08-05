//
//  MainTabbarController.swift
//  DYZB
//
//  Created by ios on 05/08/2019.
//  Copyright © 2019 zcw. All rights reserved.
//

import UIKit

class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let storyNameArr = ["Home", "Live", "Follow", "Profile"]
        for name in storyNameArr {
            addChildVC(storyName: name)
        }
    }
    

    private func addChildVC(storyName: String) {
        // 获取StoryBoard控制器
        let childVC = UIStoryboard.init(name: storyName, bundle: nil).instantiateInitialViewController()!
        // 添加子控制器
        addChild(childVC)
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
