//
//  ContactDetailViewController.swift
//  Contacts App
//
//  Created by MacBook Pro on 11/9/15.
//  Copyright © 2015 Peter Flanagan. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {

    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    @IBOutlet weak var streetAddress: UILabel!
    
    @IBOutlet weak var city: UILabel!
    
    
    @IBOutlet weak var state: UILabel!
    
    @IBOutlet weak var zipCode: UILabel!
    
    
    var selectedContact : Contact!
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        self.firstName.text = self.selectedContact.firstName
        self.lastName.text = self.selectedContact.lastName
        self.phoneNumber.text = self.selectedContact.phoneNumber
        self.streetAddress.text = self.selectedContact.streetAddress
        self.city.text = self.selectedContact.city
        self.state.text = self.selectedContact.state
        self.zipCode.text = self.selectedContact.zipCode

        // Do any additional setup after loading the view.
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
