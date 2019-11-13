//
//  CoreDataStack.swift
//  PlaylistCodable
//
//  Created by Chris Anderson on 11/13/19.
//  Copyright © 2019 Aaron Martinez. All rights reserved.
//

import Foundation
import CoreData

// Creating the enum CoreDataStack.
enum CoreDataStack {
    // Creating and initializing the persistent container.
    static let container: NSPersistentContainer = {
        // Creating the container and we are matching it with the name ("PlaylistCodable") from our data model.
        let container = NSPersistentContainer(name: "PlaylistCodable")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error) :: \(error.userInfo)")
            }
        }
        return container
    }()
    
    // Creating this varibale gives easier access to our Managed Object Context (MOC) through coredatastack.context.
    static var context: NSManagedObjectContext { return container.viewContext }
}
