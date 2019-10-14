//
//  Favorite+CoreDataProperties.swift
//  DubDubKit
//
//  Created by Adolfo Vera Blasco on 14/10/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//
//

import Foundation
import CoreData


extension Favorite {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorite> {
        return NSFetchRequest<Favorite>(entityName: "Favorite")
    }

    @NSManaged public var createdAt: TimeInterval
    @NSManaged public var name: String?
    @NSManaged public var backdrop: URL?

}
