//
//  ManagePageViewController.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/18/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit
import UIKit

class ManagePageViewController: UIPageViewController {
    var photos = ["home", "carImages", "Products", "macbookAir"]
    var currentIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        // 1
        if let viewController = viewPhotoCommentController(currentIndex ?? 0) {
            let viewControllers = [viewController]
            // 2
            setViewControllers(viewControllers,
                               direction: .Forward,
                               animated: false,
                               completion: nil)
        }
    }
    
    func viewPhotoCommentController(index: Int) -> ImageScrollPageViewController? {
        if let storyboard = storyboard,
            page = storyboard.instantiateViewControllerWithIdentifier("ImageScrollPageViewController") as? ImageScrollPageViewController {
            page.photoName = photos[index]
            
            if(index == photos.count - 1 )
            {
                
            }
            else
            {
            page.nextPhotoName = photos[index+1]
            }
            page.photoIndex = index
            return page
        }
        return nil
    }
}

//MARK: implementation of UIPageViewControllerDataSource
extension ManagePageViewController: UIPageViewControllerDataSource {
    // 1
    func pageViewController(pageViewController: UIPageViewController,
                            viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        if let viewController = viewController as? ImageScrollPageViewController {
            var index = viewController.photoIndex
            guard index != NSNotFound && index != 0 else { return viewPhotoCommentController(((photos.count-1) - index)) } // Return Nil for stopping Infinite Loop
            

            index = index - 1
            return viewPhotoCommentController(index)
        }
        return nil
    }
    
    // 2
    func pageViewController(pageViewController: UIPageViewController,
                            viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        if let viewController = viewController as? ImageScrollPageViewController {
            var index = viewController.photoIndex
            guard index != NSNotFound else { print("NOT FOUND"); return nil }
            index = index + 1
            guard index != photos.count else {return viewPhotoCommentController(((photos.count) - index))}
            return viewPhotoCommentController(index)
        }
        return nil
    }
//    
//    // MARK: UIPageControl
//    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
//        // 1
//       // return photos.count
//    }
//    
//    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
//        // 2
//       // return currentIndex ?? 0
//    }
}
