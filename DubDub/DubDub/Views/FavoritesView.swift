//
//  FavoritesView.swift
//  DubDub
//
//  Created by Adolfo Vera Blasco on 28/06/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//

import SwiftUI
import Foundation

import DubDubKit

internal struct FavoritesView : View
{
    //// Request donde se obtiene todas las sesiones marcadas como **favoritas** por el usuario
    @FetchRequest(fetchRequest: DataManager.shared.fetchRequestFavoriteSessions()) var favoriteSessions: FetchedResults<Favorite>

    /// Vista
    internal var body: some View
    {
        List(self.favoriteSessions) { favoriteSession in 
            FavoriteCellView(for: favoriteSession)
                .padding([ .top, .bottom ], 8)
        }        
    }
}

#if DEBUG
struct FavoritesView_Previews : PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
#endif
