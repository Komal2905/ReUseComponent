//
//  MenuTableTableViewController.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/9/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit
import PagingMenuController
import imglyKit

class MenuTableTableViewController: UITableViewController {
    
    
    var menu = ["Pull Notification","Image Slider","Camera Demo","Sliding Menu","Grid View","Text To Speech","Image Edit","Social Sharing","Search Drop Down","Show Right Side Menu","Play Audio/Video","Web Browser","Image With Backgroung","Show Contacts","Gyro ","Speech To Text","Gif Image","Accelorometer"]
    
    // For PullTORefresh
    
    var refreshControl1: UIRefreshControl!
    var timer: NSTimer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // For pull to refresh
        refreshControl1 = UIRefreshControl()
        self.tableView.addSubview(refreshControl1!)
        refreshControl1.backgroundColor = UIColor.lightTextColor()

        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    // Start Pull to Fresh
    func doSomething() {
        timer = NSTimer.scheduledTimerWithTimeInterval(4.0, target: self, selector: #selector(MenuTableTableViewController.endOfWork), userInfo: nil, repeats: true)
        
        
        menu.insert("A New Notification", atIndex: 0)
    }
    
    func endOfWork() {
        refreshControl1!.endRefreshing()
        
        
        self.tableView.reloadData()
        
        timer.invalidate()
        timer = nil
    }
    
    override func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if refreshControl1.refreshing {
            doSomething()
        }
    }
    
    //---END PULL TO PUSH

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menu.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = menu[indexPath.row]

        // Configure the cell...

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        
        if(indexPath.row == 0)
        {
            
            performSegueWithIdentifier("showPullNotification", sender: self)
        }
        if(indexPath.row == 1)
        {
            performSegueWithIdentifier("showImagSlider", sender: self)
        }
        
        if(indexPath.row == 2)
        {
            performSegueWithIdentifier("accessCamera", sender: self)
        }
        
        if(indexPath.row == 3)
        {
            performSegueWithIdentifier("showSLidingMenu", sender: self)
        }
        if(indexPath.row == 4)
        {
            performSegueWithIdentifier("showGridView", sender: self)
        }
        
        if(indexPath.row == 5)
        {
            performSegueWithIdentifier("textToSpeech", sender: self)
        }
        
        if(indexPath.row == 6)
        {
            performSegueWithIdentifier("showImageEditing", sender: self)
        }
        if(indexPath.row == 7)
        {
            performSegueWithIdentifier("shareSocial", sender: self)
        }
        if(indexPath.row == 8)
        {
            performSegueWithIdentifier("searchDropDown", sender: self)
        }
        
        if(indexPath.row == 9)
        {
            performSegueWithIdentifier("showRightSideMenu", sender: self)
        }
        
        if(indexPath.row == 10)
        {
            performSegueWithIdentifier("mediaSelect", sender: self)
        }
        
        if(indexPath.row == 11)
        {
            performSegueWithIdentifier("showWeb", sender: self)
        }
        if(indexPath.row == 12)
        {
            performSegueWithIdentifier("showImageAsBG", sender: self)
        }
        
        if(indexPath.row == 13)
        {
            performSegueWithIdentifier("fetchContact", sender: self)
        }
        
        if(indexPath.row == 14)
        {
            performSegueWithIdentifier("motion", sender: self)
        }
        
        
        if(indexPath.row == 15)
        {
            performSegueWithIdentifier("speechToText", sender: self)
        }
        if(indexPath.row == 16)
        {
            performSegueWithIdentifier("playGif", sender: self)
        }
        
        if(indexPath.row == 17)
        {
            performSegueWithIdentifier("showAccelometer", sender: self)
        }
        
        
       
        
        
        
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showPullNotification"
        {
            segue.destinationViewController as! PullNotificationViewController
        }
        
        if segue.identifier == "showImagSlider"
        {
            _ = segue.destinationViewController as! ImageSliderHomeViewController
        }
        if segue.identifier == "accessCamera"
        {
            _ = segue.destinationViewController as! CameraInterFaceViewController
        }
        
        if segue.identifier == "showSLidingMenu"
        {
            _ = segue.destinationViewController as! SlidingMenuFirstViewController
            

        }
        
        if segue.identifier == "showGridView"
        {
            _ = segue.destinationViewController as! GridViewViewController
            
            
        }
        
        if segue.identifier == "textToSpeech"
        {
            _ = segue.destinationViewController as! TextToSpeechViewController
            
            
        }
        if segue.identifier == "showImageEditing"
        {
           
           // segue.destinationViewController as! ImageEditingViewController
            
            var a = segue.destinationViewController as! IMGLYCameraViewController
            a = IMGLYCameraViewController(recordingModes: [.Photo, .Video])
        }
        
        if segue.identifier == "shareSocial"
        {
            segue.destinationViewController as! SocialSharingViewController
        }
        
        if segue.identifier == "searchDropDown"
        {
            segue.destinationViewController as! SeachTableViewViewController
        }
        
        if segue.identifier == "showRightSideMenu"
        {
            
            //let nav = segue.destinationViewController as! UINavigationController
           // nav.viewControllers.first as! SideBarMenuViewController
            
            
            segue.destinationViewController as! SideBarMenuViewController
        }
        
        
        if segue.identifier == "mediaSelect"
        {
            segue.destinationViewController as! SelectAudioViewController
        }
        
        if segue.identifier == "showWeb"
        {
            segue.destinationViewController as! IntegrateWebBrowserViewController
        }
        
        
        if segue.identifier == "showImageAsBG"
        {
            segue.destinationViewController as! ImageWithBackgroundViewController
        }
        
        if segue.identifier == "fetchContact"
        {
            segue.destinationViewController as! ShowContactsViewController
        }
        
        if segue.identifier == "motion"
        {
            segue.destinationViewController as! MotionViewController
        }
        
        if segue.identifier == "speechToText"
        {
            segue.destinationViewController as! SpeechToTextViewController
        }
        
        if segue.identifier == "playGif"
        {
            segue.destinationViewController as! PlayGifImageViewController
        }
        
        
        if segue.identifier == "showAccelometer"
        {
            segue.destinationViewController as! ShowAccelometerViewController
        }
        
        
    }
 

}


// For Sliding Menu



