//
//  ShowMaterialViewController.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/18/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit

import MaterialKit

import Material

class ShowMaterialViewController: UIViewController,UITextFieldDelegate {

    
    var timer = NSTimer()
    @IBOutlet weak var activityIndicator: MKActivityIndicator!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var password: MKTextField!
    @IBOutlet weak var name: TextField!
    var color : [UIColor] = [UIColor.redColor(),UIColor.blueColor(),UIColor.greenColor(),UIColor.yellowColor(),UIColor.magentaColor(),UIColor.brownColor()]
    
    var index = Int()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        activityIndicator.startAnimating()
        index = 0
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ShowMaterialViewController.changeColor), userInfo: nil, repeats: true)
        
        password.delegate = self
        name.delegate = self
        
        
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow), name:UIKeyboardWillShowNotification, object: nil)
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHide), name:UIKeyboardWillHideNotification, object: nil)
        
        
        password.layer.borderColor = UIColor.clearColor().CGColor
        
    }
    
    
    func changeColor()
    {
        
        activityIndicator.color = color[index]
        
        if(index == 0)
        {
            index = index + 1
        }
        
        index = index + 1

        if(index == 6)
        {
            index = index - 1
            
        }
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func keyboardWillShow(notification:NSNotification){
        
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue()
        keyboardFrame = self.view.convertRect(keyboardFrame, fromView: nil)
        
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        self.scrollView.contentInset = contentInset
    }
    
    func keyboardWillHide(notification:NSNotification){
        
        let contentInset:UIEdgeInsets = UIEdgeInsetsZero
        self.scrollView.contentInset = contentInset
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
