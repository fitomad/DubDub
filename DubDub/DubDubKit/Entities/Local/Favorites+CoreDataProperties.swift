//
//  Favorites+CoreDataProperties.swift
//  DubDubKit
//
//  Created by Adolfo Vera Blasco on 13/10/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//
//

import Foundation
import CoreData


extension Favorites {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorites> {
        return NSFetchRequest<Favorites>(entityName: "Favorites")
    }

    @NSManaged public var createdAt: TimeInterval
    @NSManaged public var name: String?

}
