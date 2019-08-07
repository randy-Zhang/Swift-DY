//
//  RecommendCycleView.swift
//  DYZB
//
//  Created by 张昌伟 on 2019/8/7.
//  Copyright © 2019 zcw. All rights reserved.
//

import UIKit

class RecommendCycleView: UIView {

    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension RecommendCycleView {
    
    class func recommendCycleView() -> RecommendCycleView {
        
        return Bundle.main.loadNibNamed("RecommendCycleView", owner: nil, options: nil)?.first as! RecommendCycleView
    }
}
