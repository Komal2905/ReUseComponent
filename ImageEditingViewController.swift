//
//  ImageEditingViewController.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/11/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit
import imglyKit

class ImageEditingViewController: UIViewController {

    var window: UIWindow?
    override func viewDidLoad() {
        super.viewDidLoad()
        let cameraViewController = IMGLYCameraViewController(recordingModes: [.Photo, .Video])
        cameraViewController.maximumVideoLength = 15
        cameraViewController.squareMode = false
        
        
        
      // cameraViewController.topControlsView.removeFromSuperview()
        //presentViewController(cameraViewController, animated: true, completion: nil)
        
        
        
        
//        window = UIWindow(frame: UIScreen.mainScreen().bounds)
//        window?.rootViewController = cameraViewController
//        
//        window?.makeKeyAndVisible()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "A"
        {
           var cameraViewController =  segue.destinationViewController as! IMGLYCameraViewController
            cameraViewController = IMGLYCameraViewController(recordingModes: [.Photo, .Video])
            
            //let cameraViewController = IMGLYCameraViewController(recordingModes: [.Photo, .Video])
            cameraViewController.maximumVideoLength = 15
            cameraViewController.squareMode = true
        }
    }
    
    
 

}
