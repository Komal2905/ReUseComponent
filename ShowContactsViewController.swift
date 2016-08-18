//
//  ShowContactsViewController.swift
//  ReUseComponent
//
//  Created by ProjectHeena on 8/16/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit
import ContactsUI
import Contacts


class ShowContactsViewController: UIViewController,CNContactPickerDelegate{
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var numberLabel: UILabel!
    
    
    @IBOutlet weak var emailLabel: UILabel!
    
        var pushTimer:NSTimer = NSTimer()
        var mainTimer:NSTimer = NSTimer()

    override func viewDidLoad() {
        super.viewDidLoad()

        mainTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ShowContactsViewController.someFunction(_:)), userInfo: nil, repeats: false)
    }
    
    @IBAction func showContactsButtonPressed(sender: AnyObject) {
        intializeContactPicker()
    }
    
    //
    func intializeContactPicker()
    {
        let contactPickerViewController = CNContactPickerViewController()
        
        //contactPickerViewController.predicateForEnablingContact = NSPredicate(format: "birthday != nil")
        
        contactPickerViewController.delegate = self
        
        presentViewController(contactPickerViewController, animated: true, completion: nil)
        
    }
    
    
    
    func contactPicker(picker: CNContactPickerViewController, didSelectContact contact: CNContact) {
        
        let status = CNContactStore.authorizationStatusForEntityType(.Contacts)
        if status == .Denied || status == .Restricted {
            
            print("User denied to Contact access")
                return
        }
        
        print("Contact",contact)
        
        let store = CNContactStore()
        let contactsFullName = [CNContact]()
        
        let request = CNContactFetchRequest(keysToFetch: [CNContactIdentifierKey, CNContactFormatter.descriptorForRequiredKeysForStyle(.FullName)])
        
        do {
            try store.enumerateContactsWithFetchRequest(request) { contact, stop in
                // contactsFullName.append(contacts)
                
              //  contactsFullName = contacts
                // contacts = contact
            }
        }
        catch
        {
            print("Error In COntact",error)
        }

        let formatter = CNContactFormatter()
        
        formatter.style = .FullName
        let name  = formatter.stringFromContact(contact)
        
        nameLabel.text = name
        
        
        if contact.isKeyAvailable(CNContactPhoneNumbersKey)
        {
            
            
            if let
                phonenumberValue = contact.phoneNumbers.first,
                pn = phonenumberValue.value as? CNPhoneNumber where phonenumberValue.value is CNPhoneNumber
            {
               // phoneNumber = pn.stringValue
                
                numberLabel.text = pn.stringValue
            }
        }
        
        if contact.isKeyAvailable(CNContactEmailAddressesKey)
        {
            
            
            
            if ( contact.emailAddresses.first  == nil)
            {
                print("This is Nill")
                emailLabel.text = ""
            }
                
            else
            {
                if let emailValue =  contact.emailAddresses.first!.value as? String
                {
                    
                    emailLabel.text = emailValue
                }
            }
        }
        

        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func someFunction(delta: Int) {
        
       
        // Send alert to user if app is open
            let alertView = UIAlertController(title: "This is an Alert!", message: "", preferredStyle: UIAlertControllerStyle.Alert)
            alertView.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertView, animated: true, completion: nil)
            
            // Send user a local notification if they have the app running in the bg
            pushTimer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(ShowContactsViewController.pushNotification), userInfo: nil, repeats: false)
        
        
    }
    
    // Send user a local notification if they have the app running in the bg
    func pushNotification() {
        let notification = UILocalNotification()
        notification.alertAction = "Go back to App"
        notification.alertBody = "This is a Notification!"
        notification.fireDate = NSDate(timeIntervalSinceNow: 1)
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
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
