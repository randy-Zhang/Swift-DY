//
//  Date-Extension.swift
//  DYZB
//
//  Created by ios on 07/08/2019.
//  Copyright © 2019 zcw. All rights reserved.
//

import Foundation

extension Date {
    
    static func getCurrentTime() -> String {
        
        let date = Date()
        let interval = date.timeIntervalSince1970
        
        return "\(interval)"
    }
}
