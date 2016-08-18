//
//  TextToSpeechViewController.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/10/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit
import AVFoundation

class TextToSpeechViewController: UIViewController,AVAudioPlayerDelegate, AVAudioRecorderDelegate, UITextFieldDelegate,UITextViewDelegate {
    
     @IBOutlet weak var textView: UITextView!
    
    var myUtterance = AVSpeechUtterance(string: "")
    let synth = AVSpeechSynthesizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func textToSpeech(sender: UIButton)
    {
        setSessionPlayerOn()
        myUtterance = AVSpeechUtterance(string: textView.text)
        myUtterance.rate = 0.3
        synth.speakUtterance(myUtterance)
    }
    func setSessionPlayerOn()
    {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayAndRecord)
        } catch _ {
        }
        do {
            try AVAudioSession.sharedInstance().setActive(true)
        } catch _ {
        }
        do {
            try AVAudioSession.sharedInstance().overrideOutputAudioPort(AVAudioSessionPortOverride.Speaker)
        } catch _ {
        }
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
