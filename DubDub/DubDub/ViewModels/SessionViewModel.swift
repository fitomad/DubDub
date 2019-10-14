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

internal class SessionViewModel: ObservableObject
{    
    ///
    @Published internal var isFavorite: Bool

    /**

    */
    internal init(forSession name: String)
    {
        self.isFavorite = DataManager.shared.existsFavoriteSesssion(named: name)

        $isFavorite
            .sink(receiveValue: { favorited: Bool -> Void in 
                if favorited
                {
                    DataManager.shared.insertFavoriteSession(named: name)
                }
                else
                {
                    DataManager.shared.deleteFavoriteSession(named: name)
                }
            })
    }
}
