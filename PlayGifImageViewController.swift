//
//  PlayGifImageViewController.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/17/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit
import Gifu

class PlayGifImageViewController: UIViewController,UIPopoverPresentationControllerDelegate {
    
     @IBOutlet weak var animationImageView: UIImageView!
    
    @IBOutlet weak var animationImageViewFromLibary: AnimatableImageView!
    
    
    
    @IBOutlet weak var toggle1Button: UIButton!
    
    @IBOutlet weak var toggle2Button: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let url : NSURL = NSBundle.mainBundle().URLForResource("mugen", withExtension: "gif")!
        
        
        // For Animating the gif Image . Have to Import UIImage+ANimatedGIF
        let testImage = UIImage.animatedImageWithAnimatedGIFData(
            NSData(contentsOfURL: url)!)
        self.animationImageView.animationImages = testImage!.images
        self.animationImageView.animationDuration = testImage!.duration
        //self.animationImageView.animationRepeatCount = 10
        self.animationImageView.image = testImage!.images?.last
        self.animationImageView.startAnimating()
        
        animationImageView.image = UIImage.animatedImageWithAnimatedGIFURL(url)
        animationImageView.hidden = false
        
        
        animationImageViewFromLibary.animateWithImage(named: "mugen.gif")
        
        animationImageViewFromLibary.startAnimatingGIF()
        
        toggle1Button.alpha = 0
        toggle2Button.alpha = 0
        
        
        let tapGestureRecognizer1 = UITapGestureRecognizer(target:self, action:#selector(PlayGifImageViewController.image1Tapper(_:)))
        animationImageView.userInteractionEnabled = true
        animationImageView.addGestureRecognizer(tapGestureRecognizer1)
        
        
        
        let tapGestureRecognizer2 = UITapGestureRecognizer(target:self, action:#selector(PlayGifImageViewController.image2Tapper(_:)))
        animationImageViewFromLibary.userInteractionEnabled = true
        animationImageViewFromLibary.addGestureRecognizer(tapGestureRecognizer2)
        
        
        


    }
    
    
    func image1Tapper(img : AnyObject)
    {
        
        print("Here")
        toggle1Button.alpha = 1
        

        
        
        if animationImageView.isAnimating()
        {
            animationImageView.stopAnimating()
            
        }
        else
        {
            toggle1Button.alpha = 0
            animationImageView.startAnimating()
            
        }

        
    }
    
    
    
    func image2Tapper(img : AnyObject)
    {
        toggle2Button.alpha = 1
        
        if animationImageViewFromLibary.isAnimatingGIF
        {
            animationImageViewFromLibary.stopAnimatingGIF()
            toggle2Button.alpha = 1
        }
        else
        {
            toggle2Button.alpha = 0
            animationImageViewFromLibary.startAnimatingGIF()
            
        }

        
    }
    
    @IBAction func toggleButtonPressed(sender: AnyObject) {
        
    }
    
    
    @IBAction func toggleButtonPressed2(sender: AnyObject) {
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
     @IBAction func showDialog(sender: AnyObject) {
        
        let storyboard : UIStoryboard = UIStoryboard(
            name: "Main",
            bundle: nil)
        
        
        let menuViewController: ShowGifBgViewController = storyboard.instantiateViewControllerWithIdentifier("ShowGifBgViewController") as! ShowGifBgViewController
        
        print("POPOVER")
        menuViewController.modalPresentationStyle = .Popover //.OverCurrentContext//
        

      //  menuViewController.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext

        
        if let popoverController = menuViewController.popoverPresentationController {
            
            
            
            //menuViewController.preferredContentSize = CGSizeMake(260,350)
            popoverController.delegate = self
            popoverController.sourceView = self.view
            
            popoverController.permittedArrowDirections = UIPopoverArrowDirection()
            
            popoverController.sourceRect = CGRectMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds),0,0)
            
            menuViewController.preferredContentSize = CGSizeMake(self.view.layer.frame.width - 50 ,self.view.layer.frame.height/2)
            
        }
        
        
        
        presentViewController(menuViewController, animated: true, completion: nil)

        
       

 }
    
    
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return UIModalPresentationStyle.None
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "a"
        {
            let b = segue.destinationViewController as! ShowGifBgViewController
            
            b.modalPresentationStyle = .Custom
        }
    }
    

}
