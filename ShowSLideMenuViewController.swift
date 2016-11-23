//
//  ShowSLideMenuViewController.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/9/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit
import PagingMenuController

// Print("For View which has container")

class ShowSLideMenuViewController: UIViewController {
    var options: PagingMenuControllerCustomizable!

    override func viewDidLoad() {
        super.viewDidLoad()
        let pagingMenuController = self.childViewControllers.first as! PagingMenuController
        pagingMenuController.delegate = self
        print("HERE")
        
        print("OPTIONS",options)
        pagingMenuController.setup(options)
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


extension ShowSLideMenuViewController: PagingMenuControllerDelegate {
    // MARK: - PagingMenuControllerDelegate
    
    func willMoveToPageMenuController(menuController: UIViewController, previousMenuController: UIViewController) {
    }
    
    func didMoveToPageMenuController(menuController: UIViewController, previousMenuController: UIViewController) {
    }
    
    func willMoveToMenuItemView(menuItemView: MenuItemView, previousMenuItemView: MenuItemView) {
    }
    
    func didMoveToMenuItemView(menuItemView: MenuItemView, previousMenuItemView: MenuItemView) {
    }
}