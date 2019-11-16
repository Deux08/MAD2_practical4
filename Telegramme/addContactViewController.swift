//
//  addContactViewController.swift
//  Telegramme
//
//  Created by Rasyid Waterkamp on 5/11/19.
//  Copyright © 2019 Rasyid Waterkamp. All rights reserved.
//

import UIKit
import Foundation

class AddContactViewController : UIViewController{
    
    @IBOutlet weak var firstNameFld: UITextField!
    @IBOutlet weak var lastNameFld: UITextField!
    @IBOutlet weak var mobileFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func cancelBtn(_ sender: Any) {
        firstNameFld.text = ""
        lastNameFld.text = ""
        mobileFld.text = ""
    }
    
    
    @IBAction func createBtn(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let contact:Contact = Contact(firstname: String(firstNameFld.text!), lastname: String(lastNameFld.text!), mobileno: String(mobileFld.text!))
        
        appDelegate.contactList.append(contact)
        
        print(String(appDelegate.contactList.count))
    }
}
