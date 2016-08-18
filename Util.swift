//
//  Util.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/10/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import Foundation
//
//  Util.swift
//  AutomationApp
//
//  Created by ProjectHeena on 4/22/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import Foundation
import UIKit

public class Util
{
    
    func bottomBorderTextfield(textfield : UITextField)
    {
        
        let border = CALayer()
        let width = CGFloat(0.9)
        border.borderColor = UIColor.darkGrayColor().CGColor
        border.frame = CGRect(x: 0, y: textfield.frame.size.height - width, width:  textfield.frame.size.width, height: textfield.frame.size.height)
        
        
        
        border.borderWidth = width
        textfield.layer.addSublayer(border)
        textfield.layer.masksToBounds = true
    }
    
    func roundLable(label:UILabel)
    {
        label.layer.cornerRadius =  label.frame.size.height/2
        label.layer.masksToBounds = true
        
    }
    
    
    func bottomBorderButon(button : UIButton)
    {
        
        let border = CALayer()
        let width = CGFloat(0.9)
        border.borderColor = UIColor.darkGrayColor().CGColor
        border.frame = CGRect(x: 0, y: button.frame.size.height - width, width:  button.frame.size.width, height: button.frame.size.height)
        
        
        
        border.borderWidth = width
        button.layer.addSublayer(border)
        button.layer.masksToBounds = true
    }
    
    
    func bottomBorderLabel(label : UILabel)
    {
        
        let border = CALayer()
        let width = CGFloat(0.9)
        border.borderColor = UIColor.grayColor().CGColor
        border.frame = CGRect(x: 0, y: label.frame.size.height - width, width:  label.frame.size.width, height: label.frame.size.height)
        
        
        
        border.borderWidth = width
        label.layer.addSublayer(border)
        label.layer.masksToBounds = true
    }
    
    func borderLabel(label : UILabel)
    {
        let border = CALayer()
        let width = CGFloat(0.9)
        border.borderColor = UIColor.lightGrayColor().CGColor
        border.frame = CGRect(x: 0, y: 0, width:  label.frame.size.width, height: label.frame.size.height)
        
        
        
        border.borderWidth = width
        label.layer.addSublayer(border)
        label.layer.masksToBounds = true
        
    }
    
    func setBorderButton(button : UIButton)
    {
        let border = CALayer()
        let width = CGFloat(0.9)
        border.borderColor = UIColor.lightGrayColor().CGColor
        border.frame = CGRect(x: 0, y: 0, width:  button.frame.size.width, height: button.frame.size.height)
        
        
        
        border.borderWidth = width
        button.layer.addSublayer(border)
        button.layer.masksToBounds = true
        
    }
    
    
    func setLightGrayBorderTextField(textField : UITextField)
    {
        textField.layer.borderColor = UIColor.lightGrayColor().CGColor
        textField.layer.borderWidth = 1.0
    }
    
    
    // only roundCorner
    func roundButton(button : UIButton)
    {
        // make button Raounded
        
        button.layer.cornerRadius = 20
        
        // define border of button
        
        button.layer.borderWidth = 1.0
        
        // define border color
        button.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
    
    
    
    // function for round ImageView
    
    // This function takes ImageView as a parameter and return round ImageView
    func roundImage(imageView : UIImageView)
    {
        
        imageView.layer.borderWidth = 1.0
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.darkGrayColor().CGColor
        
        imageView.layer.cornerRadius =  imageView.frame.size.height/2
        
        
        imageView.clipsToBounds = true
        // imageView.contentMode = .ScaleAspectFill
        
    }
    
    
    
    func roundImageForRoute(imageView : UIImageView)
    {
        imageView.layer.borderWidth = 2.0
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.darkGrayColor().CGColor
        
        imageView.layer.cornerRadius =  30
        imageView.clipsToBounds = true
        imageView.contentMode = .ScaleAspectFill
        
    }
    
    
    func roundImageGray(imageView : UIImageView)
    {
        imageView.layer.borderWidth = 2.0
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        imageView.layer.cornerRadius =  imageView.frame.size.height/2
        imageView.clipsToBounds = true
        imageView.contentMode = .ScaleAspectFill
        
    }
    
    
    
    
    
    /*
     Image Resizing Techniques: http://bit.ly/1Hv0T6i
     */
    func scaleUIImageToSize(let image: UIImage, let size: CGSize) -> UIImage {
        let hasAlpha = false
        let scale: CGFloat = 0.0 // Automatically use scale factor of main screen
        
        UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, scale)
        image.drawInRect(CGRect(origin: CGPointZero, size: size))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage
    }
    
    
    func resizeImage(image: UIImage, newHeight: CGFloat) -> UIImage {
        let scale = newHeight / image.size.height
        let newWidth = image.size.width * scale
        UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight))
        image.drawInRect(CGRectMake(0, 0, newWidth, newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight))
        image.drawInRect(CGRectMake(0, 0, newWidth, newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func resizeImage(image: UIImage, newSize: CGSize) -> (UIImage) {
        let newRect = CGRectIntegral(CGRectMake(0,0, newSize.width, newSize.height))
        let imageRef = image.CGImage
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
        let context = UIGraphicsGetCurrentContext()
        
        // Set the quality level to use when rescaling
        CGContextSetInterpolationQuality(context, CGInterpolationQuality.High)
        let flipVertical = CGAffineTransformMake(1, 0, 0, -1, 0, newSize.height)
        
        CGContextConcatCTM(context, flipVertical)
        // Draw into the context; this scales the image
        CGContextDrawImage(context, newRect, imageRef)
        
        let newImageRef = CGBitmapContextCreateImage(context)! as CGImage
        let newImage = UIImage(CGImage: newImageRef)
        
        
        // Get the resized image from the context and a UIImage
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    
    // defining border of textfiled
    
    func textFieldBorderF6F5F5(textField : UITextField)
    {
        textField.layer.borderWidth = 1
        let borderColour = UIColor(netHex:0xF6F5F5)
        textField.layer.borderColor = borderColour.CGColor
        
    }
    
    func textFieldBorder(textField : UITextField)
    {
        textField.layer.borderWidth = 1
        let borderColour = UIColor(netHex:0x2E2E2E)
        textField.layer.borderColor = borderColour.CGColor
        
    }
    
    //Show Calnder
    func showCalenderPicker()
    {
        let picker : UIDatePicker = UIDatePicker()
        picker.datePickerMode = UIDatePickerMode.Date
        picker.addTarget(self, action: Selector("dueDateChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        let pickerSize : CGSize = picker.sizeThatFits(CGSizeZero)
        picker.frame = CGRectMake(0.0, 250, pickerSize.width, 460)
        //you probably don't want to set background color as black
        //picker.backgroundColor = UIColor.blackColor()
        //UIView.addSubview(picker)
    }
    func dueDateChanged(sender:UIDatePicker){
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        // self.myLabel.text = dateFormatter.stringFromDate(dueDatePickerView.date)
    }
    
    
    
    
    func attributedUIButton(button : UIButton,title : String)
    {
        let attrs = [
            //            NSFontAttributeName : UIFont.systemFontOfSize(19.0),
            NSForegroundColorAttributeName : UIColor.darkGrayColor(),
            NSUnderlineStyleAttributeName : 2]
        
        let attributedString = NSMutableAttributedString(string:"")
        
        let buttonTitleStr = NSMutableAttributedString(string:title, attributes:attrs)
        attributedString.appendAttributedString(buttonTitleStr)
        button.setAttributedTitle(buttonTitleStr, forState: .Normal)
    }
    
    public func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(URL: url)
            let config = NSURLSessionConfiguration.defaultSessionConfiguration()
            let session = NSURLSession(configuration: config)
            let task = session.dataTaskWithRequest(request, completionHandler: {(data, response, error) in
                
                print("Data Of Image",data)
                //userProfile = UIImage(data: data!)!
                
                //let imageData = UIImagePNGRepresentation(userProfile)! as NSData
                
                let preference = NSUserDefaults.standardUserDefaults()
                let userprofileKey = "UserProfilePictureKey"
                preference.setValue(data, forKey: userprofileKey)
                
                
            });
            
            // do whatever you need with the task e.g. run
            task.resume()
        }
    }
    
    
}


extension UIImage {
    
    class func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect: CGRect = CGRectMake(0, 0, size.width, size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

// Colour FOr Hex and RGB
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

extension CALayer {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        var border = CALayer()
        
        switch edge {
        case UIRectEdge.Top:
            border.frame = CGRectMake(0, 0, CGRectGetHeight(self.frame), thickness)
            break
        case UIRectEdge.Bottom:
            border.frame = CGRectMake(0, CGRectGetHeight(self.frame) - thickness, UIScreen.mainScreen().bounds.width, thickness)
            break
        case UIRectEdge.Left:
            border.frame = CGRectMake(0, 0, thickness, CGRectGetHeight(self.frame))
            break
        case UIRectEdge.Right:
            border.frame = CGRectMake(CGRectGetWidth(self.frame) - thickness, 0, thickness, CGRectGetHeight(self.frame))
            break
        default:
            break
        }
        
        border.backgroundColor = color.CGColor;
        
        self.addSublayer(border)
    }
    
}


// fade in and out effect

extension UIView {
    func fadeIn(duration: NSTimeInterval = 4.0, delay: NSTimeInterval = 0.0, completion: ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.alpha = 0.0
            }, completion: completion)  }
    
    func fadeOut(duration: NSTimeInterval = 5.0, delay: NSTimeInterval = 0.0, completion: (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.alpha = 1.0
            }, completion: completion)
        
        
        
    }
    
}


// underlying Text
class UnderlinedLabel: UILabel {
    
    override var text: String! {
        
        didSet {
            // swift < 2. : let textRange = NSMakeRange(0, count(text))
            let textRange = NSMakeRange(0, text.characters.count)
            let attributedText = NSMutableAttributedString(string: text)
            attributedText.addAttribute(NSUnderlineStyleAttributeName , value:NSUnderlineStyle.StyleSingle.rawValue, range: textRange)
            // Add other attributes if needed
            
            self.attributedText = attributedText
        }
    }
}


class paddingLabel : UILabel
{
    override func drawTextInRect(rect: CGRect) {
        let insets = UIEdgeInsets.init(top: 0, left: 5, bottom: 0, right: 5)
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, insets))
    }
    
    //  var a = MKLabel()
    
}


class UnderlineTextButton: UIButton {
    
    var attrs = [
        NSFontAttributeName : UIFont.systemFontOfSize(19.0),
        NSForegroundColorAttributeName : UIColor.redColor(),
        NSUnderlineStyleAttributeName : 1]
    
    
    
    
    
    override func setTitle(title: String?, forState state: UIControlState) {
        super.setTitle(title, forState: .Normal)
        self.setAttributedTitle(self.attributedString(), forState: .Normal)
    }
    
    private func attributedString() -> NSAttributedString? {
        let attributes = [
            NSFontAttributeName : UIFont.systemFontOfSize(19.0),
            NSForegroundColorAttributeName : UIColor.redColor(),
            NSUnderlineStyleAttributeName : NSUnderlineStyle.StyleSingle.rawValue
        ]
        let attributedString = NSAttributedString(string: self.currentTitle!, attributes: attributes)
        return attributedString
    }
}


// Put this piece of code anywhere you like
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}



class Colors {
    //let colorTop = UIColor(red: 192.0/255.0, green: 38.0/255.0, blue: 42.0/255.0, alpha: 1.0).CGColor
    
    let colorTop = UIColor.redColor().CGColor
    // let colorBottom = UIColor(red: 35.0/255.0, green: 2.0/255.0, blue: 2.0/255.0, alpha: 1.0).CGColor
    
    let colorBottom = UIColor.yellowColor().CGColor
    
    let gl: CAGradientLayer
    
    init() {
        gl = CAGradientLayer()
        gl.colors = [ colorTop, colorBottom]
        gl.locations = [ 0.0, 1.0]
    }
}




extension String
{
    func trim() -> String
    {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
}




extension UIBezierPath {
    
    class func getAxisAlignedArrowPoints(inout points: Array<CGPoint>, forLength: CGFloat, tailWidth: CGFloat, headWidth: CGFloat, headLength: CGFloat ) {
        
        let tailLength = forLength - headLength
        points.append(CGPointMake(0, tailWidth/2))
        points.append(CGPointMake(tailLength, tailWidth/2))
        points.append(CGPointMake(tailLength, headWidth/2))
        points.append(CGPointMake(forLength, 0))
        points.append(CGPointMake(tailLength, -headWidth/2))
        points.append(CGPointMake(tailLength, -tailWidth/2))
        points.append(CGPointMake(0, -tailWidth/2))
        
    }
    
    
    class func transformForStartPoint(startPoint: CGPoint, endPoint: CGPoint, length: CGFloat) -> CGAffineTransform{
        let cosine: CGFloat = (endPoint.x - startPoint.x)/length
        let sine: CGFloat = (endPoint.y - startPoint.y)/length
        
        return CGAffineTransformMake(cosine, sine, -sine, cosine, startPoint.x, startPoint.y)
    }
    
    
    class func bezierPathWithArrowFromPoint(startPoint:CGPoint, endPoint: CGPoint, tailWidth: CGFloat, headWidth: CGFloat, headLength: CGFloat) -> UIBezierPath {
        
        let xdiff: Float = Float(endPoint.x) - Float(startPoint.x)
        let ydiff: Float = Float(endPoint.y) - Float(startPoint.y)
        let length = hypotf(xdiff, ydiff)
        
        var points = [CGPoint]()
        self.getAxisAlignedArrowPoints(&points, forLength: CGFloat(length), tailWidth: tailWidth, headWidth: headWidth, headLength: headLength)
        
        var transform: CGAffineTransform = self.transformForStartPoint(startPoint, endPoint: endPoint, length:  CGFloat(length))
        
        var cgPath: CGMutablePathRef = CGPathCreateMutable()
        CGPathAddLines(cgPath, &transform, points, 7)
        CGPathCloseSubpath(cgPath)
        
        var uiPath: UIBezierPath = UIBezierPath(CGPath: cgPath)
        return uiPath
    }
}


extension UIImageView {
    public func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(URL: url)
            let config = NSURLSessionConfiguration.defaultSessionConfiguration()
            let session = NSURLSession(configuration: config)
            let task = session.dataTaskWithRequest(request, completionHandler: {(data, response, error) in
                
                
                
            });
            
            // do whatever you need with the task e.g. run
            task.resume()
        }
    }
}



class AnnotationArrow: UIView
{
    //MARK: Global Variables
    
    var startingPoint : CGPoint = CGPoint()
    var endingPoint : CGPoint = CGPoint()
    var arrowLength : CGFloat = CGFloat()
    var arrowPath : UIBezierPath = UIBezierPath()
    var selectedInBox_Activated_Anchor_Points = false
    
    //MARK: For resizing
    
    var kUserResizableViewDefaultMinWidth = 40.0
    var kUserResizableViewDefaultMinHeight  = 40.0
    var kUserResizableViewInteractiveBorderSize = 10.0
    
    //MARK: initFrame
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    //MARK: initCoder
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
    }
    
    func passingValues(startingPointValue : CGPoint, endingPointValue : CGPoint)
    {
        self.startingPoint = startingPointValue
        self.endingPoint = endingPointValue
        
        var xDistance : CGFloat = self.endingPoint.x - self.startingPoint.x
        var yDistance : CGFloat = self.endingPoint.y - self.startingPoint.y
        
        self.arrowLength = sqrt((xDistance * xDistance) + (yDistance * yDistance))
    }
    
    //MARK: drawRect
    
    override func drawRect(rect: CGRect)
    {
        var tailWidth : CGFloat = max(4.0, self.arrowLength * 0.07)
        var headLength : CGFloat = max(self.arrowLength / 3.0, 10.0)
        var headWidth : CGFloat = headLength * 0.9
        var strokeWidth : CGFloat = max(1.0, tailWidth * 0.25)
        
        self.layer.shadowRadius = max(4.0, tailWidth)
        
        self.arrowPath = self.bezierPathWithArrowFromPoint(self.startingPoint, endPoint: self.endingPoint, tailWidth: tailWidth, headWidth: headWidth, headLength: headLength)
        
        self.arrowPath.fill()
        self.arrowPath.stroke()
        self.arrowPath.lineWidth = strokeWidth
        self.layer.shadowPath  = self.arrowPath.CGPath
    }
    //MARK: Creating Path
    
    func bezierPathWithArrowFromPoint(startingPoint : CGPoint, endPoint : CGPoint, tailWidth : CGFloat, headWidth : CGFloat, headLength : CGFloat) -> UIBezierPath
    {
        
        var length = hypotf( Float(endPoint.x) - Float(startingPoint.x) , Float(endPoint.y) - Float(startingPoint.y))
        
        var tailLength : CGFloat = CGFloat(length) - headLength
        
        var points = [CGPointMake(0, tailWidth / 2), CGPointMake(tailLength, tailWidth / 2), CGPointMake(tailLength, headWidth / 2), CGPointMake(CGFloat(length), 0), CGPointMake(tailLength, (-headWidth) / 2), CGPointMake(tailLength, (-tailWidth) / 2 ), CGPointMake(0, (-tailWidth) / 2)]
        
        
        var cosine : CGFloat = (endPoint.x - startingPoint.x) / CGFloat(length)
        var sine : CGFloat = (endPoint.y - startingPoint.y) / CGFloat(length)
        var transform : CGAffineTransform = CGAffineTransform(a: cosine, b: sine, c: -sine, d: cosine, tx: startingPoint.x, ty: startingPoint.y)
        
        var cgPath : CGMutablePathRef = CGPathCreateMutable()
        // CGPathAddLines(cgPath, &transform, points, UInt(sizeofValue(points.count)) / 1)
        CGPathCloseSubpath(cgPath)
        
        
        CGPathAddLines(cgPath, &transform, points, (points.count / 1))
        var bezierPath : UIBezierPath = UIBezierPath(CGPath: cgPath)
        bezierPath.lineCapStyle = .Round
        bezierPath.lineJoinStyle = .Miter
        
        return bezierPath
    }
}

class InsetLabel: UILabel {
    override func drawTextInRect(rect: CGRect) {
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 5)))
    }
}





