//
//  WWDCError.swift
//  CoreWWDC
//
//  Created by Adolfo Vera Blasco on 29/06/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//

import Foundation

public enum WWDCError: Error
{
    case serverUnavailable
    case resourceNotFound
    case badRequest
    case malformedURL
    case serverError(code: Int)
    case documentBadFormat
}
