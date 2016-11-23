//
//  MultiProductViewController.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/19/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit

class MultiProductViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource  {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var subVIew: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var subViewWidth: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    // CollectionView Protocol
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! MultiProductCollectionViewCell
        
        
        
        cell.layer.cornerRadius = 1
        cell.layer.masksToBounds = true
        cell.backgroundColor = UIColor.clearColor()

        
        
        return cell
    }
    
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("selected ",indexPath.row)
    }
    
//    func collectionView(collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                               sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        
//        let height = self.view.frame.height/4
//        
//        
//        let orientation = UIApplication.sharedApplication().statusBarOrientation
//        if(orientation == .LandscapeLeft || orientation == .LandscapeRight)
//        {
//            let newHeight = self.view.frame.height/3
//            
//            print("In LandScape")
//            return CGSizeMake(self.subVIew.frame.width/4, self.subVIew.frame.height)
//        }
//        else
//        {
//            
//            return CGSizeMake(self.subVIew.frame.width/2 - 20,self.subVIew.frame.height)
//        }
//        
//        
//        // return CGSizeMake((self.view.frame.width - 20)/2 , CGFloat(height))
//        
//    }

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        //let size = CGSizeMake(self.subVIew.frame.width, self.subVIew.frame.height)
        
        
        let size = CGSizeMake(1600, self.subVIew.frame.height)
        
        
        self.scrollView.contentSize = size
        
        subViewWidth.constant = 1600
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
