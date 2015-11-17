//
//  WebServiceManager.swift
//  Contacts App
//
//  Created by MacBook Pro on 11/16/15.
//  Copyright © 2015 Peter Flanagan. All rights reserved.
//

import Foundation


struct WebServiceManager {
    
    func fetchContacts(callback : ([Contact]) -> Void) {
        
        let url = NSURL(string:
            "http://jsonplaceholder.typicode.com/users")
        let request = NSURLRequest(URL: url!)
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) {data, response, err in
            
            if err == nil {
                var contactList = [Contact]()
                
                do {
                    if let jsonArray : [ [String : AnyObject] ] = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as? [ [String:AnyObject] ] {
                        //Processing code goes here
                        for jsonDict in jsonArray {
                            let newContact = self.parseContact(jsonDict)
                            contactList.append(newContact)
                        }
                        callback(contactList)
                    }
                }
                catch {
                    callback([])
                }
            }
            else {
                print("Got an error: \(err)")
            }
        }
        task.resume()
    }
    private func parseContact(jsonDict : [String:AnyObject]) -> Contact {
        let newContact = Contact()
        newContact.phoneNumber = jsonDict["phone"] as? String
        
        if let addressDict = jsonDict["address"] as? [String : AnyObject] {
            newContact.streetAddress = addressDict["street"] as? String
            newContact.city = addressDict["city"] as? String
            newContact.zipCode = addressDict["zipcode"] as? String
            //Use the properties of addressDict here
        }
        if let fullName = jsonDict["name"] as? String {
            let fullNameArray = fullName.componentsSeparatedByString(" ")
            
            if fullNameArray.count > 1 {
                newContact.firstName = fullNameArray[0]
                newContact.lastName = fullNameArray[1]
                
            }
        }
        return newContact
    }
}



















