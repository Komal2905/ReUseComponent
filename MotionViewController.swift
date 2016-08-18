//
//  MotionViewController.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/16/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.

// This is FOr Gyro Sensor **  For Acclometer see AcceloameterVC

/// Gyro is used fro rotation

//

import UIKit
import CoreMotion
let manager = CMMotionManager()

class MotionViewController: UIViewController {
    
    @IBOutlet weak var gyroX: UILabel!
    
    @IBOutlet weak var gyroY: UILabel!
  
    @IBOutlet weak var gyroZ: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()

        
      
        if manager.gyroAvailable {
            manager.gyroUpdateInterval = 0.1
           // manager.startGyroUpdates()
            let queue = NSOperationQueue.mainQueue()
            manager.startGyroUpdatesToQueue(queue) {
                (data, error) in
                print(data?.rotationRate.x)
                
                
                // Update lable with Gyrovalu
                self.gyroX.text = String(format: "%.2f", (data?.rotationRate.x)!)
                
                self.gyroY.text = String(format: "%.2f", (data?.rotationRate.y)!)
                
                self.gyroZ.text = String(format: "%.2f", (data?.rotationRate.z)!)
            }
            
            
            
           // manager.stopGyroUpdates()


        }
        
//        if manager.accelerometerAvailable {
//            manager.accelerometerUpdateInterval = 0.1
//            manager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue()) {
//                [weak self] (data: CMAccelerometerData!, error: NSError!) in
//                accelX.text = String(format: "%.2f", data.acceleration.x)
//            }
//        }

        
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
