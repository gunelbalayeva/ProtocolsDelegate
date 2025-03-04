//
//  CoutryCollectionViewCell.swift
//  ProtocolsDelegate
//
//  Created by User on 04.03.25.
//

import UIKit
class CoutryCollectionViewCell:UICollectionViewCell {
    
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var capitalLbael: UILabel!
    
    struct Item {
        var image:FlagNames
        var country :String
        var capital:String?
    }
    
    enum FlagNames:String {
        case az
        case tr
        case ru
        case en
        
    }
    
    func configure (item :Item ) {
        flagImageView.image = UIImage(named: item.image.rawValue)
        nameLabel.text = item.country
        capitalLbael.text = item.capital
    }
}
