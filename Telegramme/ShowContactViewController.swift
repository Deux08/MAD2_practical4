//
//  ShowContactViewController.swift
//  Telegramme
//
//  Created by Rasyid Waterkamp on 5/11/19.
//  Copyright © 2019 Rasyid Waterkamp. All rights reserved.
//

import UIKit

class ShowContactViewController: UITableViewController {
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.reloadData()
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem

    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return appDelegate.contactList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
            
            let contact = appDelegate.contactList[indexPath.row]
            cell.textLabel!.text = "\(contact.firstName) \(contact.lastName)"
            cell.detailTextLabel!.text = "\(contact.mobileNo)"
            return cell
        
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let contacts = self.appDelegate.contactList[indexPath.row]
        
        let editAction = UITableViewRowAction(style: .default, title: "Edit"){(action, indexPath) in
            self.updateAction(contact: contacts, indexPath: indexPath)
        }
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete"){(action, indexPath) in
            self.deleteAction(contact: contacts, indexPath: indexPath)
        }
        
        deleteAction.backgroundColor = .red
        editAction.backgroundColor = .blue
        return [deleteAction, editAction]
    }
    
    /*---------- METHODS ----------*/
    
    private func updateAction(contact : Contact, indexPath : IndexPath){
        let alert = UIAlertController(title: "update", message: "Update this contact ?", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default){
            (action) in
            
            let firstTF = alert.textFields![0] as UITextField
            let secondTF = alert.textFields![1] as UITextField
            let thirdTF = alert.textFields![2] as UITextField
            
            contact.firstName = firstTF.text ?? contact.firstName
            contact.lastName = secondTF.text ?? contact.lastName
            contact.mobileNo = thirdTF.text ?? contact.mobileNo
            
            self.tableView?.reloadRows(at: [indexPath], with: .automatic)
        }
            
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        alert.addTextField { (textField : UITextField) -> Void in
            textField.placeholder = "Change first name"
            textField.text = contact.firstName
        }
        
        alert.addTextField { (textField2 : UITextField) -> Void in
            textField2.placeholder = "Change last name"
            textField2.text = contact.lastName
        }
        
        alert.addTextField { (textField3 : UITextField) -> Void in
            textField3.placeholder = "Change phone number"
            textField3.text = contact.mobileNo
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert,animated: true)
    }
    
    private func deleteAction(contact : Contact, indexPath : IndexPath){
        let alert = UIAlertController(title: "Delete", message: "Are you sure you want to delete this contact ?", preferredStyle: .alert)
       
        let deleteAction = UIAlertAction(title: "Yes", style: .default ) {
            (action) in self.appDelegate.contactList.remove(at: indexPath.row)
            self.tableView?.deleteRows(at: [indexPath], with: .automatic)
        }
        let cancelAction = UIAlertAction(title: "No", style: .default , handler: nil)
        
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
}
