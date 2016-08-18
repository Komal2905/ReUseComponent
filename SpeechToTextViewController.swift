//
//  SpeechToTextViewController.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/17/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit
import AVFoundation

class SpeechToTextViewController: UIViewController,SpeechToTextModuleDelegate{

    
    @IBOutlet weak var animationImageView: UIImageView!
    @IBOutlet weak var speakButton: UIButton!
    
    var speechToTextModule = SpeechToTextModule()
    var isRecording = Bool()

    override func viewDidLoad() {
        super.viewDidLoad()

        speakButton.setImage(UIImage(named: "voice_contest"), forState: .Normal)
        speechToTextModule = SpeechToTextModule(customDisplay: nil)
        speechToTextModule.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func speakTap(sender: AnyObject)
    {
        if isRecording == false {
            
            print("IS RECORDING",isRecording)
            self.startRecording()
        }
        else {
            
            print("IS RECORDING",isRecording)
            
            self.stopRecording()
        }
    }
    
    func startRecording() {
        if isRecording == false {
            //var url: NSURL = NSBundle.mainBundle()(URLForResource: "recording_animate", withExtension: "gif")
            
            
            let url : NSURL = NSBundle.mainBundle().URLForResource("recording_animate", withExtension: "gif")!
            
            
            // For Animating the gif Image . Have to Import UIImage+ANimatedGIF
            let testImage = UIImage.animatedImageWithAnimatedGIFData(
                NSData(contentsOfURL: url)!)
            self.animationImageView.animationImages = testImage!.images
            self.animationImageView.animationDuration = testImage!.duration
            self.animationImageView.animationRepeatCount = 1
            self.animationImageView.image = testImage!.images?.last
            self.animationImageView.startAnimating()
            
            animationImageView.image = UIImage.animatedImageWithAnimatedGIFURL(url)
            animationImageView.hidden = false
            speakButton.setImage(UIImage(named: "voice_contest_recording"), forState: .Normal)
            speechToTextModule.beginRecording()
            isRecording = true
        }
    }
    
    func stopRecording() {
        if isRecording {
            speakButton.setImage(UIImage(named: "voice_contest"), forState: .Normal)
            animationImageView.hidden = true
            speechToTextModule.stopRecording(true)
            isRecording = false
        }
    }
    
    
    
    override func viewWillDisappear(animated: Bool) {
        self.stopRecording()
    }
    
    func didReceiveVoiceResponse(data: [NSObject : AnyObject]) -> Bool {
        print("data HERE IS %@", data)
        self.stopRecording()
        var result: String? = ""
        let tmp: AnyObject = data["transcript"]!
        //        if (tmp is NSNumber.self) || tmp.rangeOfCharacterFromSet(NSCharacterSet.decimalDigitCharacterSet().invertedSet).location == NSNotFound {
        //            // Spell out number
        //            // incase user spell number
        //            var resultNumber: Int = Int(CInteger(tmp)!)
        //            var formatter: NSNumberFormatter = NSNumberFormatter()
        //            formatter.numberStyle = NSNumberFormatterSpellOutStyle
        //            result = formatter.stringFromNumber(resultNumber)
        //        }
        // else {
        result = tmp as? String
        // }
        //        if (result == "beautiful") {
        //            let alert: UIAlertView = UIAlertView(title: "Excelent", message: result!, delegate: nil, cancelButtonTitle: "OK", otherButtonTitles: "")
        //            alert.show()
        //        }
        //        else {
        //            if result == nil {
        //                var alert: UIAlertView = UIAlertView(title: "Error", message: "Please pronouce the word or check your microphone", delegate: nil, cancelButtonTitle: "OK", otherButtonTitles: "")
        //                alert.show()
        //            }
        //            else {
        //                var alert: UIAlertView = UIAlertView(title: "Wrong", message: "You pronouced \"\(result)\". You better try again", delegate: nil, cancelButtonTitle: "OK", otherButtonTitles: "")
        //                alert.show()
        //            }
        //        }
        //
        if result == nil {
            //var alert: UIAlertView = UIAlertView(title: "Error", message: "Please pronouce the word or check your microphone", delegate: nil, cancelButtonTitle: "OK", otherButtonTitles: "")
            
            let alert = UIAlertController(title: "Error ", message: "Please pronouce the word or check your microphone",  preferredStyle:UIAlertControllerStyle.Alert)
            
            let action = UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: { action in
                
            })
            
            alert.addAction(action)
            
            self.presentViewController(alert, animated: true, completion: nil)
            //alert.show()
        }
        else {
            let alert = UIAlertController(title: "Result ", message: result,  preferredStyle:UIAlertControllerStyle.Alert)
            
            let action = UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: { action in
                
            })
            
            alert.addAction(action)
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        return true
    }
    
    func requestFailedWithError(error: NSError) {
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
