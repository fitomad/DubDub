//
//  Session.swift
//  CoreWWDC
//
//  Created by Adolfo Vera Blasco on 27/06/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//

import Foundation

public struct Session: Codable
{
    public private(set) var sessionName: String
    public private(set) var title: String 
    public private(set) var collection: String
    public private(set) var previewURL: URL
    public private(set) var imageURL: URL
    public private(set) var overview: String
    public private(set) var platforms: [Platform]

    /**

    */
    private enum CodingKeys: String, CodingKey
    {
        case sessionName = "name"
        case title 
        case collection
        case previewURL = "preview_url"
        case imageURL = "image_url"
        case overview
        case platforms
    }
}