//
//  ContactListViewController.swift
//  Contacts App
//
//  Created by MacBook Pro on 11/9/15.
//  Copyright © 2015 Peter Flanagan. All rights reserved.
//

import UIKit

class ContactListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NewContactDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.contacts = DataManager.sharedManager.loadContacts()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.reloadData()
        
        // Do any additional setup after loading the view.
        
        
    }

    
    var contacts : [Contact]?
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath
        indexPath: NSIndexPath) {
            self.performSegueWithIdentifier("ContactDetailSegue", sender:
                self)
    }
    
    
    @IBAction func importButtonTouched(sender: AnyObject) {
        let wsm = WebServiceManager()
        wsm.fetchContacts { (newContacts) -> Void in
            for contact in newContacts {
                self.contacts?.append(contact)
            }
            DataManager.sharedManager.saveContacts(self.contacts!)
            
            self.tableView.reloadData() 
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender:AnyObject?) {
        if segue.identifier == "ContactDetailSegue" {
            if let selectedCell = self.tableView.indexPathForSelectedRow {
                let selectedContact = self.contacts![selectedCell.row]
                if let detailVC = segue.destinationViewController as? ContactDetailViewController {
                    detailVC.selectedContact = selectedContact
                }
            }
        }
        else if segue.identifier == "NewContactSegue" {
            
            if let newContactVC = segue.destinationViewController as? NewContactViewController {
                newContactVC.delegate = self
            }
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //First get the contact for the row
        let contact = self.contacts![indexPath.row]
        let cell = UITableViewCell()
        
        cell.textLabel?.text = "\(contact.firstName!) \(contact.lastName!)"
        
        print("Created cell for \(contact.firstName)")
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print ("Number of total contacts: \((self.contacts?.count)!)")
        return (self.contacts?.count)!
    }
    
    func didCreateNewContact(newContact: Contact) {
        self.contacts?.append(newContact)
        DataManager.sharedManager.saveContacts(self.contacts!)
        self.tableView.reloadData()
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
