//
//  Favorites+CoreDataClass.swift
//  DubDubKit
//
//  Created by Adolfo Vera Blasco on 13/10/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Favorites)
public class Favorites: NSManagedObject 
{
    ///
    public var formattedCreationDate: String
    {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium

        let creationDate = Date(timeIntervalSinceReferenceDate: self.createdAt)

        return formatter.string(from: creationDate)
    }
}
