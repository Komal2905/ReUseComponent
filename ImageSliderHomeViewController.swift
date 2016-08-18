//
//  ImageSliderHomeViewController.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/9/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.

        //pod 'ImageSlideshow', '~> 0.4'
        //pod "ImageSlideshow/Alamofire"





import UIKit
import ImageSlideshow
import AlamofireImage

class ImageSliderHomeViewController: UIViewController {
    
    @IBOutlet var slideshow: ImageSlideshow!
    var transitionDelegate: ZoomAnimatedTransitioningDelegate?


    override func viewDidLoad() {
        super.viewDidLoad()

        slideshow.backgroundColor = UIColor.redColor()
        slideshow.slideshowInterval = 5.0
        
        slideshow.scrollView.scrollEnabled = true
        slideshow.scrollView.showsVerticalScrollIndicator = false
        
        slideshow.pageControl.alpha = 0
       // slideshow.pageControlPosition = PageControlPosition.UnderScrollView
        //slideshow.pageControl.currentPageIndicatorTintColor = UIColor.lightGrayColor();
       // slideshow.pageControl.pageIndicatorTintColor = UIColor.blackColor();
        
        //        Local image example
        //
        //        slideshow.setImageInputs([ImageSource(imageString: "img1")!, ImageSource(imageString: "img2")!, ImageSource(imageString: "img3")!, ImageSource(imageString: "img4")!])
        
        
        //        AFURLSource example
        //
        //        slideshow.setImageInputs([AFURLSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, AFURLSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, AFURLSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!])
        
        //        SDWebImage example
        //
        //        slideshow.setImageInputs([SDWebImageSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, SDWebImageSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, SDWebImageSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!])
        
        //        AlamofireSource example
        //
        slideshow.setImageInputs([AlamofireSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, AlamofireSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, AlamofireSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!])
        
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(ImageSliderHomeViewController.click))
        slideshow.addGestureRecognizer(recognizer)

    }
    
    func click() {
        let ctr = FullScreenSlideshowViewController()
        ctr.pageSelected = {(page: Int) in
            self.slideshow.setScrollViewPage(page, animated: false)
        }
        
        ctr.initialImageIndex = slideshow.scrollViewPage
        ctr.inputs = slideshow.images
        self.transitionDelegate = ZoomAnimatedTransitioningDelegate(slideshowView: slideshow, slideshowController: ctr)
        // Uncomment if you want disable the slide-to-dismiss feature
        self.transitionDelegate?.slideToDismissEnabled = false
        ctr.transitioningDelegate = self.transitionDelegate
        self.presentViewController(ctr, animated: true, completion: nil)
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
