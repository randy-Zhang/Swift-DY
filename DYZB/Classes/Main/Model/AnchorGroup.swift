//
//  AnchorGroup.swift
//  DYZB
//
//  Created by ios on 07/08/2019.
//  Copyright © 2019 zcw. All rights reserved.
//

import UIKit

/// 主播组
class AnchorGroup: NSObject {

    /// 该数组对应的房间信息
    @objc var room_list: [[String: NSObject]]? {
        
        didSet {
            guard let room_list = room_list else {
                return
            }
            for anchor in room_list {
                anchors.append(AnchorModel(dic: anchor))
            }
        }
    }
    
    /// 组标题
    @objc var tag_name: String?
    
    /// 组图标
    @objc var icon_url: String?
    
    lazy var anchors: [AnchorModel] = [AnchorModel]()
    
    // MARK: 轮播图属性
    
    /// 昵称
    @objc var title: String?
    
    /// 轮播图url
    @objc var pic_url: String?
    
    /// 轮播图对应的主播
    @objc var cycleAnchor: AnchorModel?
    
    @objc var room: [String : NSObject]? {
        
        didSet {
            
            guard let room = room else {
                return
            }
            cycleAnchor = AnchorModel.init(dic: room)
        }
    }
    
    init(dic: [String: NSObject]) {
        super.init()
        
        setValuesForKeys(dic)
    }
    
    override init() {
        
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
//        print("未识别key： \(key)")
    }
    
    /*override func setValue(_ value: Any?, forKey key: String) {
        
        if key == "room_list" {
            
            if let dataArray = value as? [[String: NSObject]] {
                for anchor in dataArray {
                    anchors.append(AnchorModel(dic: anchor))
                }
            }
            
        }
    }*/
}


/// 主播Model
class AnchorModel: NSObject {
    
    /// 房间号
    @objc var room_id: Int = 0
    
    /// 图片
    @objc var vertical_src: String?
    
    /// 手机 1 or 电脑直播 0
    @objc var isVertical: Int = 0
    
    /// 房间名称
    @objc var room_name: String?
    
    /// 主播昵称
    @objc var nickname: String?
    
    /// 在线人数
    @objc var online: Int = 0
    
    /// 所在城市
    @objc var anchor_city: String?
    
    init(dic: [String: NSObject]) {
        super.init()
        
        setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        //        print("未识别key： \(key)")
    }
}
