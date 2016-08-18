//
//  IntegrateWebBrowserViewController.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/12/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit

class IntegrateWebBrowserViewController: UIViewController,UISearchBarDelegate {

    @IBOutlet weak var webVIew: UIWebView!
    
    @IBOutlet weak var webAddressTextField: UITextField!
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
          var searchBar:UISearchBar = UISearchBar(frame: CGRectMake(100, 0, 200, 20))
        searchBar.placeholder = "Search"
        var leftNavBarButton = UIBarButtonItem(customView:searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton
        
        let a = CGRectMake(100, 0, 200, 20)
        
        let testView = UIView(frame: a)
        testView.addSubview(searchBar)
        self.navigationItem.titleView = testView
        
        searchBar.delegate = self

     /*   let leftNavBarButton = UIBarButtonItem(customView:searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton
        
        self.navigationItem.titleView = searchBar*/
        
        
        let url = NSURL (string: "http://www.google.com")
        let requestObj = NSURLRequest(URL: url!);
        webVIew.loadRequest(requestObj)

    }
    
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        print("Search Button Clicked")
        let url = NSURL (string: searchBar.text!)
        let requestObj = NSURLRequest(URL: url!);
        webVIew.loadRequest(requestObj)
        
    }

    @IBAction func showWebPage(sender: AnyObject) {
        
        let url = NSURL (string: webAddressTextField.text!)
        let requestObj = NSURLRequest(URL: url!);
        webVIew.loadRequest(requestObj)
        
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
