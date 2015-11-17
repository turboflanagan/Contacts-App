//
//  Contact.swift
//  Contacts App
//
//  Created by MacBook Pro on 11/9/15.
//  Copyright © 2015 Peter Flanagan. All rights reserved.
//

import Foundation
class Contact {
    
    var firstName : String?
    var lastName : String?
    var phoneNumber : String?
    var streetAddress : String?
    var city : String?
    var state : String?
    var zipCode : String?
    
}

struct DataManager {
    static let sharedManager = DataManager()
    
    func saveContacts(contacts:[Contact]) {
        
    }
    
    func loadContacts() -> [Contact]? {
        var contacts = [Contact]()
//        for var i = 0; i < 10; i++ {
//            
//            var c = Contact()
//            c.firstName = "Vinny"
//            c.lastName = "Barbarino"
//            c.streetAddress = "123 Happy Street"
//            c.phoneNumber = "404-555-1212"
//            c.city = "Brooklyn"
//            c.state = "New York"
//            c.zipCode = "11201"
//            
//            contacts.append(c)
//        }
        return contacts
    }
}
















