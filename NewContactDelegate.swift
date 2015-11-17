//
//  NewContactDelegate.swift
//  Contacts App
//
//  Created by MacBook Pro on 11/11/15.
//  Copyright © 2015 Peter Flanagan. All rights reserved.
//

import Foundation


protocol NewContactDelegate : class {
    func didCreateNewContact(newContact:Contact)
}



