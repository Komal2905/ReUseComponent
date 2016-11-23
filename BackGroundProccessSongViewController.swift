//
//  BackGroundProccessSongViewController.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/20/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit
import AVFoundation

class BackGroundProccessSongViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var error: NSError?
        var success: Bool
        do {
            try AVAudioSession.sharedInstance().setCategory(
                AVAudioSessionCategoryPlayAndRecord,
                withOptions: .DefaultToSpeaker)
            success = true
        } catch var error1 as NSError {
            error = error1
            success = false
        }
        if !success {
            NSLog("Failed to set audio session category.  Error: \(error)")
        }
        
        let audioPath = NSBundle.mainBundle().pathForResource("FreshAir", ofType: "mp3")
        
        do {
            player = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath!))
            
            
        }
        catch {
            print("Something bad happened. Try catching specific errors to narrow things down")
        }
        
        
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(BackGroundProccessSongViewController.willResignActive(_:)), name: UIApplicationWillResignActiveNotification, object: nil)
        
        
        
        if UIApplication.sharedApplication().applicationState == .Active
        {
                           // self.timeLabel.text = timeString
            
                            print("SOme Text")
                        } else {
                            print("Background: ")
                        }
        
        
        
        setupNotificationSettings()
        
    }
    
    
    func willResignActive(noti : NSNotification)
    {
        
        print("Hellow")
        player.play()
        
        showPullNotificationButtonPressed()
    }
    
    
     func showPullNotificationButtonPressed() {
        
        let settings = UIApplication.sharedApplication().currentUserNotificationSettings()
        
        if settings!.types == .None {
            let ac = UIAlertController(title: "Can't schedule", message: "Either we don't have permission to schedule notifications, or we haven't asked yet.", preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(ac, animated: true, completion: nil)
            return
        }
        
        let notification = UILocalNotification()
        notification.fireDate = NSDate(timeIntervalSinceNow: 5)
        notification.alertBody = "Proccess in BackGround!"
        notification.alertAction = "song Playing!"
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.userInfo = ["CustomField1": "w00t"]
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    func setupNotificationSettings()
    {
        // Specify the notification types.
        let settings = UIUserNotificationSettings(forTypes: [.Alert, .Badge], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        
    }
    
    func checkStatus(noti : NSNotification)
    {
        
    }
    
    @IBAction func play(sender: UIBarButtonItem) {
        player.play()
        
    }
    
    
    @IBAction func stop(sender: UIBarButtonItem) {
        player.stop()
        print(player.currentTime)
        player.currentTime = 0
    }
    
    
    @IBAction func pause(sender: UIBarButtonItem) {
        
        player.pause()
    }
    
    
    @IBOutlet weak var sliderval: UISlider!
    
    
    @IBAction func slidermov(sender: UISlider) {
        
        player.volume = sliderval.value
        print(player.volume)
}

}