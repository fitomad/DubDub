//
//  SpecialCollection.swift
//  CoreWWDC
//
//  Created by Adolfo Vera Blasco on 27/06/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//

import Foundation

public struct SpecialCollection: Codable
{
    //
    public private(set) var name: String
    //
    public private(set) var sessionTitles: [String]

    /**

    */
    private enum CodingKeys: String, CodingKey
    {
        case name
        case sessionTitles = "sessions"
    }
}
