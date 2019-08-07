//
//  RecommendViewModel.swift
//  DYZB
//
//  Created by ios on 07/08/2019.
//  Copyright © 2019 zcw. All rights reserved.
//

import UIKit

class RecommendViewModel {

    
    var anchorGroups: [AnchorGroup] = [AnchorGroup]()
    private var verticalGroups: AnchorGroup = AnchorGroup()
    private var bigDataGroups: AnchorGroup = AnchorGroup()
}

extension RecommendViewModel {
    
    /// 请求数据
    func requestData(finishCallback: @escaping (_ data: [AnchorGroup]) -> ()) {
        
        var paremes = [String : Any]()
        paremes.updateValue(4, forKey: "limit")
        paremes.updateValue(0, forKey: "offset")
        paremes.updateValue(Date.getCurrentTime(), forKey: "time")
        
        let disGroup = DispatchGroup.init()
        
        disGroup.enter()
        
        NetworkTools.requestData(type: .GET, url: "http://capi.douyucdn.cn/api/v1/getbigDataRoom", parameters: paremes) { (result) in
            
            guard let dic = result as? [String : NSObject] else {return}
            
            guard let data = dic["data"] as? [[String : NSObject]] else {return}
            
            self.bigDataGroups.tag_name = "热门"
            self.bigDataGroups.icon_url = "home_header_hot"
            
            for dic in data {
                self.bigDataGroups.anchors.append(AnchorModel(dic: dic))
            }
            
//            for anchor in self.bigDataGroups {
//                print(anchor.nickname ?? "空的哦")
//            }
            disGroup.leave()
        }
        
        disGroup.enter()
        NetworkTools.requestData(type: .GET, url: "http://capi.douyucdn.cn/api/v1/getVerticalRoom", parameters: paremes) { (result) in
            
            guard let dic = result as? [String : NSObject] else {return}
            
            guard let data = dic["data"] as? [[String : NSObject]] else {return}
            
            self.verticalGroups.tag_name = "颜值"
            self.verticalGroups.icon_url = "home_header_phone"
            
            for dic in data {
                self.verticalGroups.anchors.append(AnchorModel(dic: dic))
            }
            
//            for anchor in self.verticalGroups {
//                print(anchor.nickname ?? "空的哦")
//            }
            disGroup.leave()
        }
        
        disGroup.enter()
        NetworkTools.requestData(type: .GET, url: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: paremes) { (result) in
            
            guard let dic = result as? [String : NSObject] else {
                return
            }
            
            guard let data = dic["data"] as? [[String : NSObject]] else {
                return
            }
            
            for dic in data {
                
                let group = AnchorGroup(dic: dic)
                self.anchorGroups.append(group)
            }
            
//            for group in self.anchorGroups {
//                for anchor in group.anchors {
//                    print(anchor.nickname ?? "空的哦")
//                }
//            }
            disGroup.leave()
        }
        
        disGroup.notify(queue: DispatchQueue.main) {
            self.anchorGroups.insert(self.bigDataGroups, at: 0)
            self.anchorGroups.insert(self.verticalGroups, at: 1)
            
            finishCallback(self.anchorGroups)
        }
    }
}
