//
//  CollectionsViewModel.swift
//  DubDubKit
//
//  Created by Adolfo Vera Blasco on 27/06/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

public class CollectionsViewModel: BindableObject
{
    /// Las colecciones disponibles en este momento.
    public private(set) var collections: [Collection]
    {
        didSet
        {
            self.didChange.send()
        }
    }

    // MARK: - Bindable Object Protocol -

    /// Informamos de los cambios a la vista.
    public var didChange = PassthroughtSubject<Void, Never>()

    /**

    */
    public init()
    {
        self.collections = []
    }

    //
    // MARK: - Operations - 
    //

    public func fetchCollections() -> Void
    {
        
    }
}