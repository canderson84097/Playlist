//
//  Playlist+Convenience.swift
//  PlaylistCodable
//
//  Created by Chris Anderson on 11/13/19.
//  Copyright © 2019 Aaron Martinez. All rights reserved.
//

import Foundation
import CoreData

// Import CoreData and extending playlist to allow us to create a convenience initializer.
// Playlist is a NSManaged Object.
extension Playlist {
    // Creating a convenience initializer allows us to give an initial value for our attributes which is more convenient for the developer.
    convenience init(name: String, context: NSManagedObjectContext = CoreDataStack.context) {
        
        // Initializing attributes.
        self.init(context: context)
        
        self.name = name
    }
}
