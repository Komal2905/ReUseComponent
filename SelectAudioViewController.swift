//
//  SelectAudioViewController.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/12/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import MobileCoreServices
import MediaPlayer

class SelectAudioViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate ,MPMediaPickerControllerDelegate{
    
    @IBOutlet weak var showMediaView: UIView!
    
    
    @IBOutlet weak var toggeleButton: UIButton!
    @IBOutlet weak var artImageView: UIImageView!
    
    @IBOutlet weak var timeLable: UILabel!
    var test = String()
    var player = AVPlayer()
    let musicController =  MPMusicPlayerController()/// for Audio
    
    let playerViewController = AVPlayerViewController() // for Video
    
    var playing = false
    
    var audioPlaying = false
    
    var playShow = false
    
    var player1 =  AVQueuePlayer()  // For AUdion New
    
    var startTime = NSTimeInterval()
    
    
    var urlVideo :NSURL = NSURL()
    
    
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
        let songNames = ["FreshAir","FreshAir","FreshAir"]
        let songs = songNames.map { AVPlayerItem(URL:
            NSBundle.mainBundle().URLForResource($0, withExtension: "mp3")!) }
        
//        player1 = AVQueuePlayer(items: songs)
//        player1.actionAtItemEnd = .Advance
//       // player1.addObserver(self, forKeyPath: "currentItem", options: [.New, .Initial] , context: nil)
//        player1.addPeriodicTimeObserverForInterval(CMTimeMake(1, 100), queue: dispatch_get_main_queue()) {
//            [unowned self] time in
//            let timeString = String(format: "%02.2f", CMTimeGetSeconds(time))
//            if UIApplication.sharedApplication().applicationState == .Active {
//               // self.timeLabel.text = timeString
//                
//                print("SOme Text",(timeString))
//            } else {
//                print("Background: \(timeString)")
//            }
//        }
       //player1.play()
        
        
        
        
        
       
        artImageView.alpha = 0
        toggeleButton.alpha = 0
        
        playerViewController.showsPlaybackControls = true

        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SelectAudioViewController.changeStatePlayer(_:)), name: MPMusicPlayerControllerPlaybackStateDidChangeNotification, object: musicController)
        
        
      //  NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SelectAudioViewController.changeStatePlayer(_:)), name: <#T##String?#>, object: player1)
        
        

    }
    



    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == "currentItem", let player = object as? AVPlayer,
            currentItem = player.currentItem?.asset as? AVURLAsset {
            test = currentItem.URL.lastPathComponent ?? "Unknown"
            print("Test",test)
        }
    }
    
    
    @IBAction func toggleButtonPressed(sender: AnyObject) {
        if (playShow)
        {
        if(!audioPlaying)
        {
        
        toggeleButton.setTitle("Play", forState: UIControlState.Normal)
            musicController.pause()
            
            player1.pause()
            audioPlaying = true
        }
        else
        {
            toggeleButton.setTitle("Pause", forState: UIControlState.Normal)
            musicController.play()
            player1.play()
            audioPlaying = false
        }
        }
    }
    
    func changeStatePlayer(notification : NSNotification)
    {
        
        
    }
    
    func playerStatusChange(notification: NSNotification){
        //do stuff
    }

    
    @IBAction func selectMediaButtonPressed(sender: AnyObject)
    {
        playShow = false
        artImageView.alpha = 0
        toggeleButton.alpha = 0
        musicController.stop()
        let ipcVideo = UIImagePickerController()
        ipcVideo.delegate = self
        ipcVideo.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        let kUTTypeMovieAnyObject : AnyObject = kUTTypeMovie as AnyObject
        ipcVideo.mediaTypes = [kUTTypeMovieAnyObject as! String]
        self.presentViewController(ipcVideo, animated: true, completion: nil)

    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        urlVideo = info[UIImagePickerControllerMediaURL] as! NSURL
        self.dismissViewControllerAnimated(true, completion: nil)
        
        player = AVPlayer(URL: urlVideo)
        
        playerViewController.view.alpha = 1
        
        playerViewController.player = player
        playerViewController.view.frame = self.showMediaView.bounds
        
        //let c = self.showMediaView.frame.origin.x
        
        let a = CGRectMake(0, 0, self.showMediaView.frame.width,  self.showMediaView.frame.height)
        
        
        
        playerViewController.view.frame = a
        
        
        playerViewController.player?.play()
        
        showMediaView.addSubview(playerViewController.view)
        
        

        
        
        
    }
   
    // For selection Audio FIle

    @IBAction func selectAudionPressed(sender: AnyObject) {
        artImageView.alpha = 1
        toggeleButton.alpha = 1
        playerViewController.view.alpha = 0
        let mediaPicker = MPMediaPickerController(mediaTypes: .Any)
        mediaPicker.delegate = self
        mediaPicker.allowsPickingMultipleItems = true
        mediaPicker.prompt = "Select song"
        


        self.presentViewController(mediaPicker, animated: true, completion: nil)
        
    }
    
    
    func mediaPicker(mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
//        if (mediaItemCollection) {
//            
//            [musicPlayer setQueueWithItemCollection: mediaItemCollection];
//            [musicPlayer play];
        
         let selectedSong = mediaItemCollection.items[0] as MPMediaItem
        
        let itemURL = selectedSong.valueForProperty(MPMediaItemPropertyAssetURL) as! NSURL
        
        let playerItem = AVPlayerItem(URL: itemURL)
        print("playerItem",playerItem)
        
        
       // player1 = AVQueuePlayer()


        player1 = AVQueuePlayer(playerItem: playerItem)
        player1.actionAtItemEnd = .Advance
        
        
        player1.addPeriodicTimeObserverForInterval(CMTimeMake(1, 100), queue: dispatch_get_main_queue()) {
                        [unowned self] time in
                        let timeString = String(format: "%02.2f", CMTimeGetSeconds(time))
                        if UIApplication.sharedApplication().applicationState == .Active {
                           // self.timeLabel.text = timeString
            
                            self.timeLable.text = timeString
                            print("SOme Text",(timeString))
                        } else {
                            self.timeLable.text = timeString
                            print("Background: \(timeString)")
                        }
                    }
        
        
        player1.play()
        
        
        
        
        // ## ANOTHER WAY
       
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
        
        
  /*     // musicController.setQueueWithItemCollection(mediaItemCollection)
       // musicController.play()
        
        
        
        var currentItem = MPMediaItem()
        currentItem = musicController.nowPlayingItem!
        artImageView.alpha = 1
        toggeleButton.alpha = 1
//       // artImageView.image = UIImage(named: "a")
       let newImageData = currentItem.valueForProperty(MPMediaItemPropertyArtwork)
       // artImageView.image = newImage
        
        var NewImage = UIImage(named: "Mac")
        
        if ((newImageData) != nil) {
           // NewImage = [artwork imageWithSize: CGSizeMake (200, 200)];
            
            NewImage = newImageData?.imageWithSize(CGSizeMake (200, 200))
        }
        
        artImageView.image = NewImage

         
        */
        playShow = true


    }
    func mediaPickerDidCancel(mediaPicker: MPMediaPickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
