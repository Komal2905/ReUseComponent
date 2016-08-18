//
//  SlidingMenuFirstViewController.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/10/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//


// This file instatioalte the View Controller for Sliding menu also give which type of slinding need to show


import UIKit
import PagingMenuController

class SlidingMenuFirstViewController: UIViewController {
    
    var optionNumber = Int()
    
    var optionSubNumber = Int()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func type1ButtonPressed(sender: AnyObject) {
        optionNumber = 0
        optionSubNumber = 0
        self.performSegueWithIdentifier("showSubMenu", sender: self)
        
    }
    
    @IBAction func type2ButtonPressed(sender: AnyObject) {
        optionNumber = 0
        optionSubNumber = 1
        self.performSegueWithIdentifier("showSubMenu", sender: self)

    }
    
    @IBAction func type3ButtonPressed(sender: AnyObject) {
        optionNumber = 0
        optionSubNumber = 2
        self.performSegueWithIdentifier("showSubMenu", sender: self)

    }
    
    @IBAction func type4ButtonPressed(sender: AnyObject) {
        optionNumber = 1
        optionSubNumber = 0
        self.performSegueWithIdentifier("showSubMenu", sender: self)

    }
    
    @IBAction func type5ButtonPressed(sender: AnyObject) {
        optionNumber = 1
        optionSubNumber = 1
        self.performSegueWithIdentifier("showSubMenu", sender: self)

    }
    
    @IBAction func type6ButtonPressed(sender: AnyObject) {
        optionNumber = 2
        optionSubNumber = 0
        self.performSegueWithIdentifier("showSubMenu", sender: self)

    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if segue.identifier == "showSubMenu"
        {
        let viewController = segue.destinationViewController as! ShowSLideMenuViewController
        
        
         let sectionType = Section(indexPath: optionNumber, row: optionSubNumber)
         
         print("sectionType.options",sectionType)
         
         viewController.title = "A"
         viewController.options = sectionType!.options
        }
    }
 

}



private enum Section {
    case All(content: AllContent)
    case MenuView(content: MenuViewContent)
    case MenuController(content: MenuControllerContent)
    
    private enum AllContent: Int { case Standard, SegmentedControl, Infinite }
    private enum MenuViewContent: Int { case Underline, RoundRect }
    private enum MenuControllerContent: Int { case Standard }
    
    
    
    
    init?(indexPath: Int, row : Int) {
        switch (indexPath,row) {
        case (0,0):
            //print("Row" , row)
            guard let content = AllContent(rawValue: 0) else { return nil }
            self = .All(content: content)
        case (0,1):
            //print("Row" , row)
            guard let content = AllContent(rawValue: 1) else { return nil }
            self = .All(content: content)
        case (0,2):
            //print("Row" , row)
            guard let content = AllContent(rawValue: 2) else { return nil }
            self = .All(content: content)
        case (1,0):
            guard let content = MenuViewContent(rawValue: 0) else { return nil }
            self = .MenuView(content: content)
        case (1,1):
            guard let content = MenuViewContent(rawValue: 1) else { return nil }
            self = .MenuView(content: content)
        case (2,0):
            guard let content = MenuControllerContent(rawValue: 0) else { return nil }
            self = .MenuController(content: content)
        default: return nil
        }
    }
    
    
    
    var options: PagingMenuControllerCustomizable {
        let options: PagingMenuControllerCustomizable
        switch self {
        case .All(let content):
            switch content {
            case .Standard:
                options = PagingMenuOptions1()
            case .SegmentedControl:
                options = PagingMenuOptions2()
            case .Infinite:
                options = PagingMenuOptions3()
            }
        case .MenuView(let content):
            switch content {
            case .Underline:
                options = PagingMenuOptions4()
            case .RoundRect:
                options = PagingMenuOptions5()
            }
        case .MenuController(let content):
            switch content {
            case .Standard:
                options = PagingMenuOptions6()
            }
        }
        return options
    }
}