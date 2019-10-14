//
//  DataManager+Session.swift
//  DubDubKit
//
//  Created by Adolfo Vera Blasco on 13/10/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//

import CoreData
import Foundation


public extension DataManager
{
    /**
     
    */
    func fetchFavoriteSesssion(named name: String) -> Favorites?
    {
        guard let container = self.storeContainer else
        {
            return nil
        }
        
        let request: NSFetchRequest<Favorites> = Favorites.fetchRequest()
        
        request.predicate = NSPredicate(format: "name = %@", argumentArray: [ name ])
        
        if let results = try? container.viewContext.fetch(request), let favorite = results.first
        {
            return favorite
        }
        
        return nil
    }
    
    /**
     
    */
    func fetchRequestFavoriteSessions() -> NSFetchRequest<Favorites>
    {
        let request: NSFetchRequest<Favorites> = Favorites.fetchRequest()
        
        let sortDate = NSSortDescriptor(key: "createdAt", ascending: false)
        let sortName = NSSortDescriptor(key: "name", ascending: true)
        
        request.sortDescriptors = [ sortDate, sortName ]
        
        return request
    }
    
    /**
     
    */
    func insertFavoriteSession(named name: String) -> Void
    {
        guard let container = self.storeContainer else
        {
            return
        }
        
        let favoriteSession = NSEntityDescription.insertNewObject(forEntityName: "Favorites", into: container.viewContext) as! Favorites
        
        favoriteSession.name = name
        favoriteSession.createdAt = Date().timeIntervalSinceReferenceDate
        
        self.saveContext()
    }
    
    /**
     
    */
    func deleteFavoriteSession(named name: String) -> Void
    {
        guard let container = self.storeContainer else
        {
            return
        }
        
        guard let favoriteSession = self.fetchFavoriteSesssion(named: name) else
        {
            return
        }
        
        container.viewContext.delete(favoriteSession)
        
        self.saveContext()
    }
}
