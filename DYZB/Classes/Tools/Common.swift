//
//  Common.swift
//  DYZB
//
//  Created by ios on 05/08/2019.
//  Copyright © 2019 zcw. All rights reserved.
//

import UIKit

let kWindow = UIApplication.shared.keyWindow

/// 屏幕的高
let K_ScreenHeight = UIScreen.main.bounds.height

/// 屏幕的宽
let K_ScreenWidth = UIScreen.main.bounds.width

/// tabbar 的高度
let K_BarHeight = UIView.isPhoneX() ? 83.0 : 49.0

/// 导航栏的高度
let K_NavHeight = UIView.isPhoneX() ? 88.0 : 64.0












extension UIView {
    
    /// 是否是iphoneX
    class func isPhoneX() -> Bool {
        
        var isPhoneX: Bool = false
        if UIDevice.current.userInterfaceIdiom != UIUserInterfaceIdiom.phone {
            return isPhoneX
        }
        if #available(iOS 11.0, *) {
            if kWindow?.safeAreaInsets.bottom ?? 0 > CGFloat(0) {
                isPhoneX = true
            }
        }
        return isPhoneX
    }
}

