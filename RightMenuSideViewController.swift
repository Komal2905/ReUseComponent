//
//  RightMenuSideViewController.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/12/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit

class RightMenuSideViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
let arrayTest = ["One","Two","Three"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTest.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        if (indexPath.row == 0)
        {
            cell = tableView.dequeueReusableCellWithIdentifier("cell")!
        }
        if (indexPath.row == 1)
        {
            cell = tableView.dequeueReusableCellWithIdentifier("cell1")!
        }
        if (indexPath.row == 2)
        {
            cell = tableView.dequeueReusableCellWithIdentifier("cell2")!
        }
        cell.textLabel?.text = arrayTest[indexPath.row]
        return cell    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
