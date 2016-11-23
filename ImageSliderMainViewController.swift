//
//  ImageSliderMainViewController.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/18/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit

class ImageSliderMainViewController: UIViewController {
    
    var tutorialPageViewController: PageViewController? {
        didSet {
            tutorialPageViewController?.tutorialDelegate = self
        }
    }

    @IBOutlet weak var containerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

//       containerView.backgroundColor = UIColor.clearColor()
//        containerView.opaque = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        print("IN Seuge")
        
        
        // 4 view
        if let tutorialPageViewController = segue.destinationViewController as? PageViewController
        {
            self.tutorialPageViewController = tutorialPageViewController
        }
        
        if let scrollSlide = segue.destinationViewController as?  ManagePageViewController
        {
            
        }

    }

}


// for 4 VC
extension ImageSliderMainViewController: PageViewControllerDelegate {
    
    func tutorialPageViewController(tutorialPageViewController: PageViewController,
                                    didUpdatePageCount count: Int) {
       // pageControl.numberOfPages = count
    }
    
    func tutorialPageViewController(tutorialPageViewController: PageViewController,
                                    didUpdatePageIndex index: Int) {
        //pageControl.currentPage = index
    }
    
    
    
    
}