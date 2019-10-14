//
//  SessionViewModel.swift
//  DubDub
//
//  Created by Adolfo Vera Blasco on 14/10/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

import DubDubKit
import CoreWWDC

internal class SessionViewModel: ObservableObject
{    
    ///
    @Published internal var isFavorite: Bool

    /**

    */
    internal init(forSession session: Session)
    {
        self.isFavorite = DataManager.shared.existsFavoriteSesssion(named: session.title)
        
        $isFavorite
            .dropFirst()
            .receive(on: RunLoop.main)
            .sink(receiveValue: { (favorited: Bool) -> Void in 
                if favorited
                {
                    DataManager.shared.insertFavoriteSession(named: session.title, backdrop: session.imageURL)
                }
                else
                {
                    DataManager.shared.deleteFavoriteSession(named: session.title)
                }
            })
    }
}
