//
//  Song+Convenience.swift
//  PlaylistCodable
//
//  Created by Chris Anderson on 11/13/19.
//  Copyright © 2019 Aaron Martinez. All rights reserved.
//

import Foundation
import CoreData

// Import CoreData
// Song is a managed object.
extension Song {
    // Discardable result allows us to forego the wildcarding when creating a new song.
    @discardableResult convenience init(songName: String, artist: String, playlist: Playlist, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        
        self.songName = songName
        self.artist = artist
        // Where we are connecting the relationship when we pass in a playlist.
        self.playlist = playlist
    }
}
