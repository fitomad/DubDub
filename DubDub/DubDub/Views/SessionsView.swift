//
//  VideosView.swift
//  DubDub
//
//  Created by Adolfo Vera Blasco on 27/06/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//

import SwiftUI

import DubDubKit
import CoreWWDC

internal struct SessionsView : View
{
    ///
    @ObjectBinding private var collectionList = CollectionsViewModel()

    var body: some View
    {
        NavigationView
        {
            List
            {
                NavigationButton(destination: FavoritesView()) {
                    Text("Favoritos")
                        .fontWeight(.semibold)
                        .foregroundColor(.accentColor)
                }
                .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))

                NavigationButton(destination: WatchingView()) {
                    Text("Continuar viendo")
                        .fontWeight(.semibold)
                        .foregroundColor(.accentColor)
                }
                .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
                
                NavigationButton(destination: AllSessionsView()) {
                    Text("Todos los vídeos")
                        .fontWeight(.semibold)
                        .foregroundColor(.accentColor)
                }
                .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
                
                // Colecciones especiales
                ForEach(self.collectionList.collections) { collection in
                    CollectionSection(collectionDetails: collection)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationBarTitle(Text("Sesiones"))
        }
        
    }
}

#if DEBUG
struct VideosView_Previews : PreviewProvider {
    static var previews: some View {
        SessionsView()
    }
}
#endif
