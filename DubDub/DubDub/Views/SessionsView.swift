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
    @State private var showNavigatorView = false
    
    ///
    @ObservedObject private var collectionList = CollectionsViewModel()

    var body: some View
    {
        NavigationView
        {
            List
            {
                NavigationLink(destination: FavoritesView()) {
                    Text("Favoritos")
                        .fontWeight(.semibold)
                        .foregroundColor(.accentColor)
                }
                .padding(EdgeInsets(top: 12.0, leading: 24.0, bottom: 12.0, trailing: 24.0))
                .tag("favoritos")

                NavigationLink(destination: WatchingView()) {
                    Text("Continuar viendo")
                        .fontWeight(.semibold)
                        .foregroundColor(.accentColor)
                }
                .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
                .tag("watching")
                
                NavigationLink(destination: AllSessionsView()) {
                    Text("Todos los vídeos")
                        .fontWeight(.semibold)
                        .foregroundColor(.accentColor)
                }
                .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
                .tag("all")
                
                if self.collectionList.collections.isEmpty
                {
                    // La colección está vacía.
                    // Mostramos un EmptySpace
                    Text("Ahora mismo no se pueden recuperar las colecciones de sesiones")
                        .font(.title)
                        .foregroundColor(.secondary)
                        .lineLimit(nil)
                        .lineSpacing(8)
                        .padding(24)
                }
                else
                {
                    // Colecciones especiales
                    ForEach(self.collectionList.collections) { collection in
                        CollectionSection(collectionDetails: collection)
                    }
                    .listRowInsets(EdgeInsets())
                }
                
            }
            .navigationBarTitle(Text("Sesiones"))
            .navigationBarItems(trailing:
                Button(action: self.handleNavigatorButtonTap) {
                   Image(systemName: "globe")
                }
            )
            .onAppear() {
                  self.collectionList.fetchCollections()
            }
        }
        .sheet(isPresented: $showNavigatorView) {
            WebBrowser()
                .edgesIgnoringSafeArea([ .bottom ])
        }
    }
    
    private func handleNavigatorButtonTap() -> Void
    {
        self.showNavigatorView.toggle()
    }
}

#if DEBUG
struct VideosView_Previews : PreviewProvider {
    static var previews: some View {
        SessionsView()
    }
}
#endif
