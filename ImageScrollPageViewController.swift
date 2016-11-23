//
//  ImageScrollPageViewController.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/18/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//


// This show 4 images with ScrollView in UIPageVIew Ocntrroler

import UIKit

class ImageScrollPageViewController: UIViewController {

    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var secondImage: UIImageView!
    
    
     var photoName: String!
     var photoIndex: Int!
    
    var nextPhotoName:String!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let photoName = photoName {
            self.imageView1.image = UIImage(named: photoName)
        }
        
        
        print("Here Count",photoIndex)
        
        
        /*
        if let nextPhotoName = nextPhotoName {
            self.secondImage.image = UIImage(named: nextPhotoName)
        }
        else
        {
            self.secondImage.alpha = 0
        }*/

        
        
      //  scrollView.scrollRectToVisible(CGRect(x: 100, y: 200, width: 300, height: 300), animated: true)
        // or
       // scrollView.setContentOffset(CGPoint(x: 200, y: 300), animated: true)
        
        //scrollView.contentOffset = CGPointMake(200,300);


        
//        NSNotificationCenter.defaultCenter().addObserver(self,
//                                                         selector: #selector(ImageScrollPageViewController.keyboardWillShow(_:)),
//                                                         name: UIKeyboardWillShowNotification,
//                                                         object: nil)
//        NSNotificationCenter.defaultCenter().addObserver(self,
//                                                         selector: #selector(ImageScrollPageViewController.keyboardWillHide(_:)),
//                                                         name: UIKeyboardWillHideNotification,
//                                                         object: nil)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        //scrollView.contentOffset = CGPointMake(100,100);
    }
    
    func adjustInsetForKeyboardShow(show: Bool, notification: NSNotification) {
        let userInfo = notification.userInfo ?? [:]
        let keyboardFrame = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue()
        let adjustmentHeight = (CGRectGetHeight(keyboardFrame) + 20) * (show ? 1 : -1)
        scrollView.contentInset.bottom += adjustmentHeight
        scrollView.scrollIndicatorInsets.bottom += adjustmentHeight
    }
    
    func keyboardWillShow(notification: NSNotification) {
        adjustInsetForKeyboardShow(true, notification: notification)
    }
    
    func keyboardWillHide(notification: NSNotification) {
        adjustInsetForKeyboardShow(false, notification: notification)
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
