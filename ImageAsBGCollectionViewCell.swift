//
//  ImageAsBGCollectionViewCell.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/16/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit

class ImageAsBGCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gradientViewWithBlack: UIView!
    
    @IBOutlet weak var ratingLable: UILabel!
    
    
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var loweView: UIView!
    
    @IBOutlet weak var lowerLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       // bgImage.alpha = 0.5
        addGradientToView()
        addGardientToLowerView()
    }
    
    func addGradientToView()
    {
        
//        print("HERE ")
//        gradientViewWithBlack.backgroundColor = UIColor.clearColor()
//        self.gradientViewWithBlack.layer.cornerRadius = 5
//
//        
//        let gradient:CAGradientLayer = CAGradientLayer()
//        
////        gradient.startPoint = CGPoint(x: 1.0, y: 1.0)
////        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
//        gradient.frame.size = self.gradientViewWithBlack.frame.size
//       // gradient.colors = [UIColor.darkGrayColor().CGColor,UIColor.darkGrayColor().colorWithAlphaComponent(0).CGColor] //Or any colors
//        
//        
//       // gradient.colors = [UIColor.darkGrayColor().CGColor,UIColor.darkGrayColor().colorWithAlphaComponent(0.5).CGColor] //Or any colors
//        gradient.colors = [UIColor.redColor().CGColor,UIColor.redColor().colorWithAlphaComponent(0).CGColor]
//        // gradient.colors = [colorTop, colorBottom]
//        
//       // ratingLable.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.5)
//        
//        
//    gradient.locations = [ 0.0, 1.0]
//        
//        gradient.cornerRadius = 5
//        
//        
//        ratingLable.layer.cornerRadius = 20
//        ratingLable.frame = gradientViewWithBlack.bounds
//        ratingLable.backgroundColor = UIColor.clearColor()
//        gradientViewWithBlack.addSubview(ratingLable)
//                self.gradientViewWithBlack.layer.insertSublayer(gradient, atIndex: 0)
        
        gradientViewWithBlack.backgroundColor = UIColor.clearColor()
        gradientViewWithBlack.layer.cornerRadius = 5
        
        gradientViewWithBlack.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.3)
//        
    }
    
    
    func addGardientToLowerView()
    {
        
//        loweView.layer.cornerRadius = 5
//        loweView.backgroundColor = UIColor.clearColor()
//            
//            
//            let gradient:CAGradientLayer = CAGradientLayer()
//            
//           // gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
//            //gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
//            gradient.frame.size = self.loweView.frame.size
//        
//            gradient.frame = self.loweView.bounds
//            gradient.colors = [UIColor.darkGrayColor().CGColor,UIColor.darkGrayColor()] //Or any colors
//            
//            // gradient.colors = [colorTop, colorBottom]
//            
//          //  gradient.locations = [ 0.0, 1.0]
//        
//        lowerLable.backgroundColor = UIColor.clearColor()
//        
//        loweView.addSubview(lowerLable)
//            
//            self.loweView.layer.insertSublayer(gradient, atIndex: 0)
        
        
        loweView.backgroundColor = UIColor.clearColor()
        
        
        loweView.backgroundColor = UIColor.darkGrayColor().colorWithAlphaComponent(0.3)
        
        
    }
    
}
