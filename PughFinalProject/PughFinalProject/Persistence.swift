//
//  Persistence.swift
//  PughFinalProject
//
//  Created by Max Pugh on 12/10/23.
//

import Foundation
import CoreData
// this is the persistent controller that will be used to save the data
struct PersistentController{
    static let shared = PersistentController()
    let container : NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Medication")
        container.loadPersistentStores(completionHandler: {(description, error) in
            if let error = error as NSError? {
                fatalError("unresolved error:  \(error)")
            }
        })
    }
}

