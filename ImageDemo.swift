//
//  ImageDemo.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 9/2/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit
import AVFoundation



class ImageDemo: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        let size = CGSizeMake(320, 700)
        scrollView.contentSize = size
    }
}
