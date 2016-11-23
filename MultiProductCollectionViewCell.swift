//
//  MultiProductCollectionViewCell.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/19/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit

class MultiProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var roundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shadoView()
        
        

    }
    
    func shadoView()
    {
        roundView.layer.backgroundColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), [1.0, 1.0, 1.0, 1.0])
        roundView.layer.masksToBounds = false
        roundView.layer.cornerRadius = 2.0
        roundView.layer.shadowOffset = CGSizeMake(-1, 1)
        roundView.layer.shadowOpacity = 0.2
        
        roundView.layer.borderColor = UIColor.darkGrayColor().CGColor
        roundView.layer.borderWidth = 1

    }
    
}
