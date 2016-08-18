//
//  CameraInterFaceViewController.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/9/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit
import MobileCoreServices
import AVFoundation


class CameraInterFaceViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate,UIScrollViewDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    var newMedia: Bool?
    
    @IBOutlet weak var pitchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pitchButton.alpha = 0.5
        pitchButton.enabled = false
        
        self.scrollView.minimumZoomScale = 1.0;
        self.scrollView.maximumZoomScale = 6.0;
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func useCamera(sender: AnyObject) {
        
        pitchButton.alpha = 0.5
        pitchButton.enabled = false
        let videoDevices = AVCaptureDevice.devicesWithMediaType(AVMediaTypeVideo)
        var captureDevice:AVCaptureDevice
        
        for device in videoDevices{
            let device = device as! AVCaptureDevice
            if device.position == AVCaptureDevicePosition.Front {
                captureDevice = device
                break
            }
        }
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerControllerSourceType.Camera) {
            
            let imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            
            imagePicker.cameraDevice = .Rear
                //UIImagePickerControllerSourceType.Camera
            imagePicker.mediaTypes = [kUTTypeImage as NSString as String]
            imagePicker.allowsEditing = false
            
            self.presentViewController(imagePicker, animated: true,
                                       completion: nil)
            newMedia = true
        }
    }
    
    @IBAction func useCameraRoll(sender: AnyObject) {
        
        pitchButton.alpha = 0.5
        pitchButton.enabled = false
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerControllerSourceType.SavedPhotosAlbum) {
            let imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.sourceType =
                UIImagePickerControllerSourceType.PhotoLibrary
            imagePicker.mediaTypes = [kUTTypeImage as NSString as String]
            imagePicker.allowsEditing = false
            self.presentViewController(imagePicker, animated: true,
                                       completion: nil)
            newMedia = false
        }
    }

    @IBAction func useFrontCameraButtonPressed(sender: AnyObject) {
        pitchButton.alpha = 0.5
        pitchButton.enabled = false
        
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerControllerSourceType.Camera) {
            
            let imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            
            imagePicker.cameraDevice = .Front
            //UIImagePickerControllerSourceType.Camera
            imagePicker.mediaTypes = [kUTTypeImage as NSString as String]
            imagePicker.allowsEditing = false
            
            self.presentViewController(imagePicker, animated: true,
                                       completion: nil)
            newMedia = true
        }

    }
    
    
    
    @IBAction func pinchZoomButtonPreesed(sender: AnyObject)
    {
       // self.scrollView.minimumZoomScale = 1.0;
       // self.scrollView.maximumZoomScale = 20.0;
    }
    
    // Delegate method for pinch and Zoom using UIScolView
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
    {
        return self.imageView
    }

    // delegate method UIPOcker
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let mediaType = info[UIImagePickerControllerMediaType] as! String
        
        self.dismissViewControllerAnimated(true, completion: nil)
        pitchButton.alpha = 1
        pitchButton.enabled = true
        
        if (mediaType == (kUTTypeImage as String)) {
            let image = info[UIImagePickerControllerOriginalImage]
                as! UIImage
            
            imageView.image = image
            
            if (newMedia == true) {
                UIImageWriteToSavedPhotosAlbum(image, self,
                                               #selector(CameraInterFaceViewController.image(_:didFinishSavingWithError:contextInfo:)), nil)
            } else if (mediaType == (kUTTypeMovie as String)) {
                // Code to support video here
            }
            
        }

    }
    

    
    func image(image: UIImage, didFinishSavingWithError error: NSErrorPointer, contextInfo:UnsafePointer<Void>) {
        pitchButton.alpha = 1
        pitchButton.enabled = true
        
        if error != nil {
            let alert = UIAlertController(title: "Save Failed",
                                          message: "Failed to save image",
                                          preferredStyle: UIAlertControllerStyle.Alert)
            
            let cancelAction = UIAlertAction(title: "OK",
                                             style: .Cancel, handler: nil)
            
            alert.addAction(cancelAction)
            self.presentViewController(alert, animated: true,
                                       completion: nil)
        }
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
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


class EnableZoom : UIImageView{
    
    override var image: UIImage?{
        didSet {
            if image != nil{
             
            } else {
                //clean your filter or added layer (remove your effects over the view)
            }
        }
    }
    
}

