//
//  Session+Identifiable.swift
//  DubDubKit
//
//  Created by Adolfo Vera Blasco on 29/06/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//

import SwiftUI
import Foundation

import CoreWWDC

extension Session: Identifiable
{
    ///
    public var id: String
    {
        return self.sessionName
    }
}
