//
//  CollectionNormalCell.swift
//  DYZB
//
//  Created by ios on 06/08/2019.
//  Copyright © 2019 zcw. All rights reserved.
//

import UIKit

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
            
            onlineBtn.setTitle("\(anchor.online)", for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
}
