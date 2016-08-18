//
//  GridViewViewController.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/10/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit

class GridViewViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    
    @IBOutlet weak var gridCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(GridViewViewController.rotated), name: UIDeviceOrientationDidChangeNotification, object: nil)

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
    
    
    
    
    // CollectionView Protocol
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 12
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("grid", forIndexPath: indexPath) as! GridResultCollectionViewCell
        
        
        
        cell.layer.cornerRadius = 5
        cell.layer.masksToBounds = true
        cell.backgroundColor = UIColor.whiteColor()
        if((indexPath.row%2) == 0)
        {
        cell.imageView.alpha = 1
            
        cell.halfImageView.alpha = 0
            cell.someLable.alpha = 0
            
            if(indexPath.row == 4 || indexPath.row ==  8)
            {
                cell.imageView.image = UIImage(named: "Mac")
                
            }
            else
            {
                cell.imageView.image = UIImage(named: "MenuSLide")

                
            }

        }
        
        else
        {
            cell.imageView.alpha = 0
            cell.halfImageView.alpha = 1
            cell.someLable.alpha = 1
            
            cell.halfImageView.image = UIImage(named: "Products")
            
            if(indexPath.row == 3 || indexPath.row == 11 )
            {
                cell.halfImageView.image = UIImage(named: "kurkure")
 
            }
            else
            {
                cell.halfImageView.image = UIImage(named: "Products")

            }
            cell.someLable.text = "100 $"
        }
        
    
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

}
