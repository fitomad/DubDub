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
    /// Si esta sesión está marcada como favorita o no
    @Published internal var isFavorite: Bool

    /**
        Crea un *ViewModel* para una sesión

        - Parameter session: La sesión que gestiona este *ViewModel*
    */
    internal init(forSession session: Session)
    {
        // Recuperamos el estado actual de la sesión
        self.isFavorite = DataManager.shared.existsFavoriteSesssion(named: session.title)
        
        $isFavorite
            // 1
            .dropFirst()
            // 2
            .receive(on: RunLoop.main)
            // 3
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
