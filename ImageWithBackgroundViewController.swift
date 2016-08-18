//
//  ImageWithBackgroundViewController.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/16/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit

class ImageWithBackgroundViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    
    @IBOutlet weak var gridCollectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ImageWithBackgroundViewController.rotated), name: UIDeviceOrientationDidChangeNotification, object: nil)
    }

    func rotated()
    {
        if(UIDeviceOrientationIsLandscape(UIDevice.currentDevice().orientation))
        {
            gridCollectionView.reloadData()
        }
        
        if(UIDeviceOrientationIsPortrait(UIDevice.currentDevice().orientation))
        {
            print("Portrait")
            gridCollectionView.reloadData()
        }
        
    }
    
    
    // CollectionView Protocol
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("grid", forIndexPath: indexPath) as! ImageAsBGCollectionViewCell
        
        print("Size of cell",cell.frame)
        
        cell.ratingLable.layer.cornerRadius = 20
        
        cell.layer.cornerRadius = 5
        cell.layer.masksToBounds = true
        cell.backgroundColor = UIColor.whiteColor()

        
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let height = self.view.frame.height/4
        
        
        let orientation = UIApplication.sharedApplication().statusBarOrientation
        if(orientation == .LandscapeLeft || orientation == .LandscapeRight)
        {
            let newHeight = self.view.frame.height/3
            
            print("In LandScape")
            return CGSizeMake(self.view.frame.width/4 - 20, newHeight)
        }
        else
        {
            
            return CGSizeMake(self.view.frame.width/2 - 20, CGFloat(height))
        }
        
        
        // return CGSizeMake((self.view.frame.width - 20)/2 , CGFloat(height))
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
