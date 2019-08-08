//
//  CollectionNormalCell.swift
//  DYZB
//
//  Created by ios on 06/08/2019.
//  Copyright © 2019 zcw. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionNormalCell: UICollectionViewCell {

    @IBOutlet weak var showImageView: UIImageView!
    @IBOutlet weak var onlineBtn: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var anchor: AnchorModel? {
        
        didSet {
            guard let anchor = anchor else {
                return
            }
            titleLabel.text = anchor.room_name
            nameLabel.text = anchor.nickname
            if anchor.online > 10000 {
                onlineBtn.setTitle("\(Int(anchor.online / 10000))万在线", for: .normal)
            } else {
                onlineBtn.setTitle("\(anchor.online)在线", for: .normal)
            }
            
            showImageView.kf.setImage(with: URL(string: anchor.vertical_src ?? ""), placeholder: UIImage(named: "Img_default"))
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
}
