//
//  SocialSharingViewController.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/11/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit

class SocialSharingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func shareTextButtonPressed(sender: AnyObject) {
        let text = "This is some text that I want to share."
        
        // set up activity view controller
        let objectsToShare: [AnyObject] = [ text ]
        let activityViewController = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        //activityViewController.excludedActivityTypes = [ UIActivityTypeAirDrop, UIActivityTypePostToFacebook ]
        
        // present the view controller
        self.presentViewController(activityViewController, animated: true, completion: nil)

    }
    
    
    @IBAction func shareImageButtonPressed(sender: AnyObject) {
        let imageToShare = UIImage(named:"Mac")
        // set up activity view controller
        let objectsToShare: [AnyObject] = [ imageToShare! ]
        let activityViewController = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        //activityViewController.excludedActivityTypes = [ UIActivityTypeAirDrop, UIActivityTypePostToFacebook ]
        
        // present the view controller
        self.presentViewController(activityViewController, animated: true, completion: nil)
    }
    
    @IBAction func shareURLButtonPressed(sender: AnyObject) {
        let url = NSURL(string: "http://www.google.com/")
        
        guard let urlTosend = url
        else
        {
            print("Noting found")
            return
        }
        
        // set up activity view controller
        let objectsToShare: [AnyObject] = [ urlTosend ]
        let activityViewController = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        //activityViewController.excludedActivityTypes = [ UIActivityTypeAirDrop, UIActivityTypePostToFacebook ]
        
        // present the view controller
        self.presentViewController(activityViewController, animated: true, completion: nil)
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
