//
//  UIColor-Extension.swift
//  DYZB
//
//  Created by ios on 06/08/2019.
//  Copyright © 2019 zcw. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
    }
}
