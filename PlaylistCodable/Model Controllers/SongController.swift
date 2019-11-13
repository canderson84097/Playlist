//
//  SongController.swift
//  PlaylistCodable
//
//  Created by Aaron Martinez on 11/1/17.
//  Copyright © 2017 Aaron Martinez. All rights reserved.
//

import Foundation

class SongController {
    
    static func create(songWithName name: String, artist: String, playlist: Playlist) {
        // Creating a song and it is by default being added to our MOC.
        Song(songName: name, artist: artist, playlist: playlist)
        // Ensures that any changes that have been made are saved to Managed Object Context to the persistent store.
        PlaylistController.shared.saveToPersistentStore()
    }
    
    static func delete(song: Song) {
        let moc = CoreDataStack.context
        // Deleting the song from our Managed Object Context.
        moc.delete(song)
        // Ensures that any changes that have been made are saved to Managed Object Context to the persistent store.
        PlaylistController.shared.saveToPersistentStore()
    }
}
