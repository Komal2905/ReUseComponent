//
//  SeachTableViewViewController.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/11/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit
import DropDown

class SeachTableViewViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate,UISearchResultsUpdating,UITextFieldDelegate{

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableViewSearch: UITableView!
    
    
    
    var searchController = UISearchController()
    var shouldShowSearchResults = false
    
    
    var contryArray =
   [ "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu & Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Odisha",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
    ]
    var filteredArray = [String]()
    
    let chooseCarBrandDropDown = DropDown()

    lazy var dropDowns: [DropDown] = {
        return [
            self.chooseCarBrandDropDown
            
        ]
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search here..."
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        // Place the search bar view to the tableview headerview.
        tableViewSearch.tableHeaderView = searchController.searchBar
        
        
        
        
        
        //** this is FOr FropDown Custome
        searchTextField.delegate = self
        
       // setupChooseCarBrandDropDown()
       // searchTextField.addTarget(self, action: #selector(SeachTableViewViewController.chageText(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        
        searchTextField.addTarget(self, action: #selector(SeachTableViewViewController.chageTextTapped(_:)), forControlEvents: UIControlEvents.EditingDidBegin)
        searchTextField.addTarget(self, action: #selector(SeachTableViewViewController.chageText(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        
        
        
       //
        DropDown.appearance().textColor = UIColor.blackColor()
        DropDown.appearance().textFont = UIFont.systemFontOfSize(15)
        DropDown.appearance().backgroundColor = UIColor.whiteColor()
        DropDown.appearance().selectionBackgroundColor = UIColor.redColor().colorWithAlphaComponent(0.5)
        DropDown.appearance().cellHeight = 60
    }
    
    
    func chageText(text : UITextField)
    {
        print("change Text Typing")
        
        if(text.text?.characters.count == 0)
        {
            shouldShowSearchResults = false
        }
        else
        {
            shouldShowSearchResults = true
        }
        
        filteredArray = contryArray.filter({ (country) -> Bool in
            let countryText: NSString = country
            
            return (countryText.rangeOfString(text.text!, options: NSStringCompareOptions.CaseInsensitiveSearch).location) != NSNotFound
        })
        setupChooseCarBrandDropDown()
        
        chooseCarBrandDropDown.show()

    }
    
    func chageTextTapped(text : UITextField)
    {
        print("chageTextTapped")
        shouldShowSearchResults = false
        
        
        filteredArray = contryArray.filter({ (country) -> Bool in
            let countryText: NSString = country
            
            return (countryText.rangeOfString(text.text!, options: NSStringCompareOptions.CaseInsensitiveSearch).location) != NSNotFound
        })
        setupChooseCarBrandDropDown()
        
        chooseCarBrandDropDown.show()
        
    }
    
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    var countOfArray = Int()
        
       if shouldShowSearchResults
       {
        countOfArray = filteredArray.count
       }
        else
       {
        countOfArray =  contryArray.count
        }
        
        return countOfArray
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("contry", forIndexPath: indexPath)
        
        if shouldShowSearchResults {
            cell.textLabel?.text = filteredArray[indexPath.row]
        }
        else {
            cell.textLabel?.text = contryArray[indexPath.row]
        }
        
        return cell

    }
    
    
    
    // Search COntroll Delgate
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        shouldShowSearchResults = true
        tableViewSearch.reloadData()
    }
    
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        shouldShowSearchResults = false
        tableViewSearch.reloadData()
    }
    
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        if !shouldShowSearchResults {
            shouldShowSearchResults = true
            tableViewSearch.reloadData()
        }
        
        searchController.searchBar.resignFirstResponder()
    }
    
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String)
    {
        // Filter the data array and get only those countries that match the search text.
        filteredArray = contryArray.filter({ (country) -> Bool in
            let countryText: NSString = country
            
            return (countryText.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch).location) != NSNotFound
        })
        
        // Reload the tableview.
        tableViewSearch.reloadData()
 
    }

    
    
    
    // MARK: UISearchResultsUpdating delegate function
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        guard let searchString = searchController.searchBar.text else {
            return
        }
        
        // Filter the data array and get only those countries that match the search text.
        filteredArray = contryArray.filter({ (country) -> Bool in
            let countryText:NSString = country
            
            return (countryText.rangeOfString(searchString, options: NSStringCompareOptions.CaseInsensitiveSearch).location) != NSNotFound
        })
        
        // Reload the tableview.
        tableViewSearch.reloadData()
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
    
    
    
    @IBOutlet weak var searchTextField: UITextField!
    
    func setupChooseCarBrandDropDown() {
        
        chooseCarBrandDropDown.anchorView = searchTextField
        
        // Will set a custom with instead of anchor view width
        //		dropDown.width = 100
        
        // By default, the dropdown will have its origin on the top left corner of its anchor view
        // So it will come over the anchor view and hide it completely
        // If you want to have the dropdown underneath your anchor view, you can do this:
       // chooseCarBrandDropDown.bottomOffset = CGPoint(x: 0, y: 100)
        
        let height = searchTextField.frame.height
        
        let text = chooseCarBrandDropDown.bounds.height
        
       chooseCarBrandDropDown.bottomOffset =  CGPoint(x: 0, y:  height)
        
        // You can also use localizationKeysDataSource instead. Check the docs.
        
        if shouldShowSearchResults
        {
            chooseCarBrandDropDown.dataSource = filteredArray
        }
        else
        {
          chooseCarBrandDropDown.dataSource = contryArray
        }
        
        
        // Action triggered on selection
        chooseCarBrandDropDown.selectionAction = { [unowned self] (index, item) in
            
            self.searchTextField.text = item
        }
       
    }

}
