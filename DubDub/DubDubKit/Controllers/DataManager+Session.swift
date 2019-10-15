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
    func existsFavoriteSesssion(named name: String) -> Bool
    {
        guard let container = self.storeContainer else
        {
            return false
        }
        
        let request: NSFetchRequest<Favorite> = Favorite.fetchRequest()
        request.predicate = NSPredicate(format: "name = %@", argumentArray: [ name ])
        
        if let results = try? container.viewContext.count(for: request), results > 0
        {
            return true
        }
        
        return false
    }

    /**
     
    */
    func fetchFavoriteSesssion(named name: String) -> Favorite?
    {
        guard let container = self.storeContainer else
        {
            return nil
        }
        
        let request: NSFetchRequest<Favorite> = Favorite.fetchRequest()
        
        request.predicate = NSPredicate(format: "name = %@", argumentArray: [ name ])
        
        if let results = try? container.viewContext.fetch(request), let favorite = results.first
        {
            return favorite
        }
        
        return nil
    }
    
    /**
        Construye un `NSFetchRequest` que enlazará directamente
        con la vista.
    */
    func fetchRequestFavoriteSessions() -> NSFetchRequest<Favorite>
    {
        let request: NSFetchRequest<Favorite> = Favorite.fetchRequest()
        
        let sortDate = NSSortDescriptor(key: "createdAt", ascending: false)
        let sortName = NSSortDescriptor(key: "name", ascending: true)
        
        request.sortDescriptors = [ sortDate, sortName ]
        
        return request
    }
    
    /**
     
    */
    func insertFavoriteSession(named name: String, backdrop imageURL: URL) -> Void
    {
        guard let container = self.storeContainer else
        {
            return
        }
        
        let favoriteSession = NSEntityDescription.insertNewObject(forEntityName: "Favorite", into: container.viewContext) as! Favorite
        
        favoriteSession.name = name
        favoriteSession.backdrop = imageURL
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
