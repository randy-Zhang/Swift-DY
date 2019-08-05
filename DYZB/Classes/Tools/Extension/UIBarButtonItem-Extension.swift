//
//  UIBarButtonItem-Extension.swift
//  DYZB
//
//  Created by ios on 05/08/2019.
//  Copyright © 2019 zcw. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    /*class func createItem(itemImage: String, highlightedImage: String, size: CGSize) -> UIBarButtonItem {
        
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage.init(named: itemImage), for: .normal)
        btn.setImage(UIImage.init(named: highlightedImage), for: .highlighted)
        btn.frame = CGRect(origin: .zero, size: size)
        
        return UIBarButtonItem.init(customView: btn)
    }*/
    
    convenience init(itemImage: String, highlightedImage: String = "", size: CGSize = .zero) {
        
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage.init(named: itemImage), for: .normal)
        if highlightedImage != "" {
            btn.setImage(UIImage.init(named: highlightedImage), for: .highlighted)
        }
        if size == .zero {
            btn.sizeToFit()
        } else {
            btn.frame = CGRect(origin: .zero, size: size)
        }
        
        self.init(customView: btn)
    }
}
