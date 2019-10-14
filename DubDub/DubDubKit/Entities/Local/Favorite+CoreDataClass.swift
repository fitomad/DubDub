//
//  Favorite+CoreDataClass.swift
//  DubDubKit
//
//  Created by Adolfo Vera Blasco on 14/10/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Favorite)
public class Favorite: NSManagedObject
{
    ///
    public var fomattedCreationDate: String
    {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        let createdDate = Date(timeIntervalSinceReferenceDate: self.createdAt)
        
        return formatter.string(from: createdDate)
    }
}

extension Favorite: Identifiable
{
    ///
    public var id: String
    {
        return self.name ?? "Untitle Session"
    }
}
