//
//  ScrollingViewController.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 9/16/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit

class ScrollingViewController: UIViewController {

    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var view1: UIView!
    
    
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var subScrolViewWidthConstains: NSLayoutConstraint!
    @IBOutlet weak var subViewTraillingConstains: NSLayoutConstraint!
    var view1x = Int()
    var view1y = Int()
    var optionArray = [String]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // SUbViews
    
    @IBOutlet weak var cntentSubView1: UIView!
    
    @IBOutlet weak var cntentSubView2: UIView!
    
    
    @IBOutlet weak var cntentSubView3: UIView!
    var scrollCheck = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        optionArray = ["grusome1","grusome2","grusome3","grusome4"]
        print("ViewSi size ViewDidLoad",view1.frame,"layer", view.layer)
        // Do any additional setup after loading the view.
        
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(ScrollingViewController.responseToSwipe(_:)))
        swipeRightGesture.direction = UISwipeGestureRecognizerDirection.Right
        
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(ScrollingViewController.responseToSwipe(_:)))
        swipeLeftGesture.direction = UISwipeGestureRecognizerDirection.Left
        
        self.view.addGestureRecognizer(swipeRightGesture)
        self.view.addGestureRecognizer(swipeLeftGesture)
        
        self.collectionView.registerNib(UINib(nibName: "ScrollCellOne", bundle: nil), forCellWithReuseIdentifier: "cell1")
        
                self.collectionView.registerNib(UINib(nibName: "ScrollCellTwo", bundle: nil), forCellWithReuseIdentifier: "cell2")
        
       /* let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5);
        layout.minimumInteritemSpacing = 5;*/
    }

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        
        let sizs = CGSizeMake(1600, (self.view.frame.width / 2))
        
        
        scrollView.contentSize = sizs
        
        subScrolViewWidthConstains.constant = 800
        
        view.layoutIfNeeded()
//        updateButton.userInteractionEnabled = true
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("ViewSi size After Subview",view1.frame,"layer", view.layer)
        
        view1x = Int(view1.frame.origin.x)
        setUpCornerRadious()
        setUpViewBorder()
        
        
    }
    func setUpCornerRadious()
    {
        view1.layer.cornerRadius = 3
        view2.layer.cornerRadius = 3
        view3.layer.cornerRadius = 3
    }
    
    func setUpViewBorder()
    {
        cntentSubView1.layer.borderColor = UIColor.lightGrayColor().CGColor
        cntentSubView1.layer.borderWidth = 1
        
        cntentSubView2.layer.borderColor = UIColor.lightGrayColor().CGColor
        cntentSubView2.layer.borderWidth = 1
        
        cntentSubView3.layer.borderColor = UIColor.lightGrayColor().CGColor
        cntentSubView3.layer.borderWidth = 1
    }
    
    
    func responseToSwipe(gesture : UISwipeGestureRecognizer)
    {
        
        print("Detect Swipe")
        if let gesture = gesture as? UISwipeGestureRecognizer
        {
            switch gesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                print("Swiped right")
                
                
                if(scrollCheck == 1)
                {
                    scrollToPre(view1.frame.origin.x)
                }
                if (scrollCheck == 2)
                {
                    scrollToPre(view2.frame.origin.x)
                }
                
                
                let index = NSIndexPath(forItem: scrollCheck, inSection: 0)
                
                collectionView.scrollToItemAtIndexPath(index, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
                
                
            case UISwipeGestureRecognizerDirection.Left:
                print("Swiped Left")
                
                scrollToNext(view1.frame.width+26)
                
                let index = NSIndexPath(forItem: scrollCheck, inSection: 0)
                
                collectionView.scrollToItemAtIndexPath(index, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
               
            
            default:
                break
            }

        }
    }
    

    @IBAction func scrollToNextButtonPressed(sender: AnyObject)
    {
       print("You print NEXt")
        
        
        scrollToNext(view1.frame.width+26)
        
       // scrollToNext((self.view.frame.width ))
    }
    
    func scrollToNext(xOffset:CGFloat)
    {
        if(scrollCheck < 2)
        {
        
        print("Offset In NEXt ",xOffset)
            
            
        let pointsToScroll = CGPointMake(scrollView.contentOffset.x + xOffset, scrollView.contentOffset.y) // Y should be same x varries
        
        
        self.scrollView.setContentOffset(pointsToScroll, animated: true)
        
        scrollCheck =  scrollCheck + 1
        }
 
    }
    
    
    @IBAction func scrollToPreButtonPressed(sender: AnyObject)
    {
        print("You print PRe")
        
        if(sender.tag == 4)
        {
           scrollToPre(view1.frame.origin.x)
        }
        if (sender.tag == 5)
        {
          scrollToPre(view2.frame.origin.x)
        }
        
        
       // scrollToPre(view1.frame.width)
        
      
    }
    func scrollToPre(xOffset:CGFloat)
    {
        
        if(scrollCheck >= 0)
        {
         
        print("OffSet In Pre",xOffset)
        let pointsToScroll = CGPointMake((xOffset - 52) , scrollView.contentOffset.y) // Y should be same x varries
        self.scrollView.setContentOffset(pointsToScroll, animated: true)
        scrollCheck =  scrollCheck - 1
        }
        
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

extension ScrollingViewController : UICollectionViewDelegate,UICollectionViewDataSource
{
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = ScrollCellCollectionViewCell()
        
        if(indexPath.row == 0)
        {
        cell = self.collectionView.dequeueReusableCellWithReuseIdentifier("cell1", forIndexPath: indexPath) as! ScrollCellCollectionViewCell
        }
        if(indexPath.row == 1 || indexPath.row == 2 )
        {
            cell = self.collectionView.dequeueReusableCellWithReuseIdentifier("cell2", forIndexPath: indexPath) as! ScrollCellCollectionViewCell
            
        }
        return cell
    }
    
     func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let sizes = CGSizeMake(((self.view.frame.width * (10/12))), (self.view.frame.height/2))
        
        return sizes
    }
    
    
}

extension ScrollingViewController : UITableViewDelegate,UITableViewDataSource
{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! ScrolInsideViewTableViewCell
        
        cell.nameLabel.text = optionArray[indexPath.row]
        return cell
    }
}

