//
//  PagingMenuControllerOptions.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/9/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.


// Comment : This file is used for Holding all submenu for menu in sliding tab
//

import Foundation
import PagingMenuController

let screenSize: CGRect = UIScreen.mainScreen().bounds
let width = screenSize.width

private var pagingControllers: [UIViewController] {
    let menu1ViewController = Menu1ViewController.instantiateFromStoryboard()
    let menu2ViewController = Menu2ViewController.instantiateFromStoryboard()
    let menu3ViewController = Menu3ViewController.instantiateFromStoryboard()
    let menu4ViewController = Menu4ViewController.instantiateFromStoryboard()
    
    
    return [menu1ViewController, menu2ViewController, menu3ViewController,menu4ViewController]
}

struct MenuItem1: MenuItemViewCustomizable {}
struct MenuItem2: MenuItemViewCustomizable {}
struct MenuItem3: MenuItemViewCustomizable {}
struct MenuItem4: MenuItemViewCustomizable {}

struct PagingMenuOptions1: PagingMenuControllerCustomizable {
    
    
    var componentType: ComponentType {
        
        return .All(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
    }
    
    struct MenuOptions: MenuViewCustomizable {
        var displayMode: MenuDisplayMode {
            return .Standard(widthMode: .Fixed(width: width/2), centerItem: true, scrollingMode: .PagingEnabled)
        }
        
        
        var focusMode: MenuFocusMode {
            return .Underline(height: 3, color: UIColor.redColor(), horizontalPadding: 10, verticalPadding: 0)
        }
        
        
        var height: CGFloat {
            return 60
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItemUsers(), MenuItemRepository(), MenuItemGists(), MenuItemOrganization()]
        }
    }
    
    struct MenuItemUsers: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "Menu1")
            let description = MenuItemText(text: " ")
            return .MultilineText(title: title, description: description)
           // return .Text(title: title)
        }
    }
    struct MenuItemRepository: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "Menu2")
            let description = MenuItemText(text:" ")
            return .MultilineText(title: title, description: description)
            //return .Text(title: title)
        }
    }
    struct MenuItemGists: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "Menu3")
            let description = MenuItemText(text: " ")
            return .MultilineText(title: title, description: description)
            //return .Text(title: title)
        }
    }
    struct MenuItemOrganization: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "Menu4")
            let description = MenuItemText(text: " ")
            return .MultilineText(title: title, description: description)
            //return .Text(title: title)
        }
    }


}

struct PagingMenuOptions2: PagingMenuControllerCustomizable {
    var dislpayMode : MenuItemDisplayMode
    {
        let title = MenuItemText(text: "Menu 1")
        return .Text(title: title)
    }
    var componentType: ComponentType {
        return .All(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
    }
    var menuControllerSet: MenuControllerSet {
        return .Single
    }

    struct MenuOptions: MenuViewCustomizable {
        var displayMode: MenuDisplayMode {
            return .SegmentedControl
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItem1(), MenuItem2(), MenuItem3(), MenuItem4()]
        }
    }
}

struct PagingMenuOptions3: PagingMenuControllerCustomizable {
    var componentType: ComponentType {
        return .All(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
    }
    var lazyLoadingPage: LazyLoadingPage {
        return .Three
    }
    
    struct MenuOptions: MenuViewCustomizable {
//        var displayMode: MenuDisplayMode {
//            return .Infinite(widthMode: .Fixed(width: 80), scrollingMode: .ScrollEnabled)
//        }
        
        var displayMode: MenuDisplayMode {
           // return .Infinite(widthMode: .Fixed(width: 80), scrollingMode: .ScrollEnabled)
            
            return .Standard(widthMode: .Fixed(width:width/4), centerItem: false, scrollingMode: .PagingEnabled)//80
            
            
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItem1(), MenuItem2(), MenuItem3(), MenuItem4()]
        }
    }
}

struct PagingMenuOptions4: PagingMenuControllerCustomizable {
    var componentType: ComponentType {
        return .MenuView(menuOptions: MenuOptions())
    }
    
    struct MenuOptions: MenuViewCustomizable {
        var displayMode: MenuDisplayMode {
            
            return .SegmentedControl
        }
        var focusMode: MenuFocusMode {
            return .Underline(height: 3, color: UIColor.blueColor(), horizontalPadding: 10, verticalPadding: 0)
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItem1(), MenuItem2(), MenuItem3(), MenuItem4()]
        }
    }
}

struct PagingMenuOptions5: PagingMenuControllerCustomizable {
    var componentType: ComponentType {
        return .MenuView(menuOptions: MenuOptions())
    }
    
    struct MenuOptions: MenuViewCustomizable {
        var displayMode: MenuDisplayMode {
            return .Infinite(widthMode: .Flexible, scrollingMode: .PagingEnabled)
        }
        var focusMode: MenuFocusMode {
            return .RoundRect(radius: 12, horizontalPadding: 8, verticalPadding: 8, selectedColor: UIColor.lightGrayColor())
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItem1(), MenuItem2(), MenuItem3(), MenuItem4()]
        }
    }
}

struct PagingMenuOptions6: PagingMenuControllerCustomizable {
    var componentType: ComponentType {
        return .PagingController(pagingControllers: pagingControllers)
    }
    var defaultPage: Int {
        return 1
    }
}