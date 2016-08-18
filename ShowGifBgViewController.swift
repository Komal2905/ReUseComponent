//
//  ShowGifBgViewController.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/17/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit

import Gifu
class ShowGifBgViewController: UIViewController {

    @IBOutlet weak var imageView: AnimatableImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.animateWithImage(named: "mugen.gif")
        
        imageView.startAnimatingGIF()
        
        self.view.backgroundColor = UIColor.clearColor()
        self.view.opaque = false
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
