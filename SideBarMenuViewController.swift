//
//  SideBarMenuViewController.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/12/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit
import SideMenu

class SideBarMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       setupSideMenu()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupSideMenu() {
        // Define the menus
        
        let storyBoard = UIStoryboard(name: "SideMenu", bundle: nil)
        SideMenuManager.menuLeftNavigationController = storyBoard.instantiateViewControllerWithIdentifier("leftMenu") as? UISideMenuNavigationController
        SideMenuManager.menuRightNavigationController = storyBoard.instantiateViewControllerWithIdentifier("rightMenu") as? UISideMenuNavigationController
        
        // Enable gestures. The left and/or right menus must be set up above for these to work.
        // Note that these continue to work on the Navigation Controller independent of the View Controller it displays!
        SideMenuManager.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        
        // Set up a cool background image for demo purposes
       // SideMenuManager.menuAnimationBackgroundColor = UIColor(patternImage: UIImage(named: "background")!)
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
