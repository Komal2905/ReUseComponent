//
//  ViewController.swift
//  Timeline
//
//  Created by Evan Dekhayser on 7/26/14.
//  Copyright (c) 2014 Evan Dekhayser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	var scrollView: UIScrollView!
    var timeline:   TimelineView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		scrollView = UIScrollView(frame: view.bounds)
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(scrollView)
		
		view.addConstraints([
			NSLayoutConstraint(item: scrollView, attribute: .Left, relatedBy: .Equal, toItem: view, attribute: .Left, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: scrollView, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 29),
			NSLayoutConstraint(item: scrollView, attribute: .Right, relatedBy: .Equal, toItem: view, attribute: .Right, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: scrollView, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: 0)
			])
		
		timeline = TimelineView(bulletType: .Circle, timeFrames: [
            TimeFrame(text: "New Year's Day", date: "January 1", image: UIImage(named: "fireworks.jpeg"),testColor:UIColor.yellowColor()),
			TimeFrame(text: "The month ", date: "February 14", image: UIImage(named: "Gift.jpg"),testColor:UIColor.magentaColor()),
			TimeFrame(text: "some test", date: "March",  image: nil,testColor:UIColor.grayColor()),
			TimeFrame(text: "April Fool.", date: "April 1", image: UIImage(named: "april-5.jpg"),testColor:UIColor.cyanColor()),
			TimeFrame(text: "NO Images", date: "No image?", image: nil,testColor:UIColor.grayColor()),
			TimeFrame(text: "This control can stretch. It doesn't matter how long or short the text is, or how many times you wiggle your nose and make a wish. The control always fits the content, and even extends a while at the end so the scroll view it is put into, even when pulled pretty far down, does not show the end of the scroll view.", date: "Long text", image: nil,testColor:UIColor.grayColor()),
			TimeFrame(text: "Last!", date: "That's it!", image: nil,testColor:UIColor.redColor())
			])
		scrollView.addSubview(timeline)
		scrollView.addConstraints([
			NSLayoutConstraint(item: timeline, attribute: .Left, relatedBy: .Equal, toItem: scrollView, attribute: .Left, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: timeline, attribute: .Bottom, relatedBy: .LessThanOrEqual, toItem: scrollView, attribute: .Bottom, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: timeline, attribute: .Top, relatedBy: .Equal, toItem: scrollView, attribute: .Top, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: timeline, attribute: .Right, relatedBy: .Equal, toItem: scrollView, attribute: .Right, multiplier: 1.0, constant: 0),
			
			NSLayoutConstraint(item: timeline, attribute: .Width, relatedBy: .Equal, toItem: scrollView, attribute: .Width, multiplier: 1.0, constant: 0)
			])
        
        
        
        

        view.sendSubviewToBack(scrollView)
	}
	
    @IBAction func bulletChanged(sender: UISegmentedControl) {
        timeline.bulletType = [BulletType.Circle, BulletType.Hexagon, BulletType.Diamond, BulletType.DiamondSlash, BulletType.Carrot, BulletType.Arrow][sender.selectedSegmentIndex]
        
        //timeline.lineColor = UIColor.redColor()
        
        print("SOme key Value",timeline.timeFrames[0])
    }

	override func prefersStatusBarHidden() -> Bool {
		return true
	}
	
	
}

