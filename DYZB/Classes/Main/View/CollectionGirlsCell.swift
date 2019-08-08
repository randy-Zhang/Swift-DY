//
//  CollectionGirlsCell.swift
//  DYZB
//
//  Created by ios on 06/08/2019.
//  Copyright © 2019 zcw. All rights reserved.
//

import UIKit

class CollectionGirlsCell: UICollectionViewCell {

    @IBOutlet weak var showImageView: UIImageView!
    @IBOutlet weak var cityBtn: UIButton!
    @IBOutlet weak var onlineLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var anchor: AnchorModel? {
     
        didSet {
            guard let anchor = anchor else {
                return
            }
            
            cityBtn.setTitle(anchor.anchor_city, for: .normal)
            if anchor.online > 10000 {
                onlineLabel.text = "\(Int(anchor.online / 10000))万在线"
            } else {
                onlineLabel.text = "\(anchor.online)在线"
            }
            nameLabel.text = anchor.nickname
            showImageView.kf.setImage(with: URL(string: anchor.vertical_src ?? ""))
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
