//
//  SpecialCollection+Identifiable.swift
//  DubDubKit
//
//  Created by Adolfo Vera Blasco on 28/06/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//

import Foundation

import CoreWWDC

extension SpecialCollection: Identifiable
{
    ///
    public var id: String
    {
        return self.name
    }
}
