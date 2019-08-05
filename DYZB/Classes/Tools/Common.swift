//
//  Common.swift
//  DYZB
//
//  Created by ios on 05/08/2019.
//  Copyright © 2019 zcw. All rights reserved.
//

import UIKit

/// 屏幕的高
let K_ScreenHeight = UIScreen.main.bounds.height

/// 屏幕的宽
let K_ScreenWidth = UIScreen.main.bounds.width

/// 是否是iphoneX
let K_isPhoneX = K_ScreenHeight == 812 ? true : false

/// tabbar 的高度
let K_BarHeight = K_isPhoneX ? 83.0 : 49.0

/// 导航栏的高度
let K_NavHeight = K_isPhoneX ? 88.0 : 64.0


