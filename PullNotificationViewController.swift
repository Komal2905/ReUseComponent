//
//  PullNotificationViewController.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/9/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit

class PullNotificationViewController: UIViewController {
    
    
    @IBOutlet weak var NotificationScheduleDateTime: UILabel!
    
    let datePickerView  : UIDatePicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNotificationSettings()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func showPullNotificationButtonPressed(sender: AnyObject) {
        
        let settings = UIApplication.sharedApplication().currentUserNotificationSettings()
        
        if settings!.types == .None {
            let ac = UIAlertController(title: "Can't schedule", message: "Either we don't have permission to schedule notifications, or we haven't asked yet.", preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(ac, animated: true, completion: nil)
            return
        }
        
        let notification = UILocalNotification()
        notification.fireDate = NSDate(timeIntervalSinceNow: 5)
        notification.alertBody = "Hey you! Yeah you! Swipe to unlock!"
        notification.alertAction = "be awesome!"
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

    @IBAction func chooseDateTimeButtonPressed(sender: AnyObject)
    
    {
        
        datePickerView.datePickerMode = UIDatePickerMode.DateAndTime
        
        datePickerView.addTarget(self, action:#selector(PullNotificationViewController.handleDatePicker(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        
        datePickerView.frame = CGRectMake(sender.frame.origin.x , sender.frame.origin.y + 100, sender.frame.size.width, 150)
        
        self.view.addSubview(datePickerView)
    }
    
    func handleDatePicker(sender: UIDatePicker) {
        datePickerView.removeFromSuperview()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy HH:mm"
        
        NotificationScheduleDateTime.text = dateFormatter.stringFromDate(sender.date)
        
        let settings = UIApplication.sharedApplication().currentUserNotificationSettings()
        
        if settings!.types == .None {
            let ac = UIAlertController(title: "Can't schedule", message: "Either we don't have permission to schedule notifications, or we haven't asked yet.", preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(ac, animated: true, completion: nil)
            return
        }
        
        let notification = UILocalNotification()
        notification.fireDate = sender.date
        notification.alertBody = "Shchedule Later Notification"
        notification.alertAction = "be awesome!"
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.userInfo = ["CustomField1": "w00t"]
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
}
