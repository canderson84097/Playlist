//
//  PlaylistController.swift
//  PlaylistCodable
//
//  Created by Aaron Martinez on 11/1/17.
//  Copyright © 2017 Aaron Martinez. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    static let shared = PlaylistController()
    
    func add(playlistWithName name: String) {
        // Creating a new playlist using the name from the parameter, we are initializing it with our CoreDataStack.context, you just cannot see that happening here because we set a default value in our convenience initializer.
        _ = Playlist(name: name)
        // Making sure that our changes to the managed objects context are saved to the persist store.
        saveToPersistentStore()
    }
    
    func delete(playlist: Playlist) {
        let moc = CoreDataStack.context
        // Going to our Managed Object Context and removing the playlist from it.
        moc.delete(playlist)
        // We want to save here so that the playlist is updated with the new Managed Object Context. Without saving the playlist would still exist in the persistent store, so this is deleting the playlist from the persistent store.
        saveToPersistentStore()
    }
    
    // MARK: - Persistence
    
    func saveToPersistentStore() {
        let moc = CoreDataStack.context
        
        do {
            // Trying to save what is in our MOC to our persistent store.
            try moc.save()
        } catch {
            // Catching the error from the do try catch block and printing what the error is.
            print("There was a problem saving to the persistent store: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Properties
    
    // New Source of TRUTH!
    // Making our playlist array a computed property.
    var playlists: [Playlist] {
        // Creating our fetch request and specifying that it will be of type playlist.
        let request: NSFetchRequest<Playlist> = Playlist.fetchRequest()
        do {
            // (try? CoreDataStack.context.fetch(request)) ?? [], this is equal to a playlist and so this line is just attempting to return an array of playlists in case no playlist has been created it will return an empty array.
            return (try? CoreDataStack.context.fetch(request)) ?? []
        }
//        } catch {
//            print("Error fetching entries: \(error)")
//        }
    }
}
