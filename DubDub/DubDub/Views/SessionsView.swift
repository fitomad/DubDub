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
            ScrollView([ .vertical ], showsIndicators: false)
            {
                VStack(alignment: .leading)
                {
                    Divider()
                        .padding(.leading, 24)
                    
                    NavigationLink(destination: FavoritesView()) {
                        HStack(alignment: .center)
                        {
                            Text("Favoritos")
                                .fontWeight(.semibold)
                                .foregroundColor(.accentColor)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                    }
                    .padding(EdgeInsets(top: 12.0, leading: 40.0, bottom: 12.0, trailing: 40.0))
                    .tag("favoritos")
                    
                    Divider()
                        .padding(.leading, 24)

                    NavigationLink(destination: WatchingView()) {
                        HStack(alignment: .center)
                        {
                            Text("Continuar viendo")
                                .fontWeight(.semibold)
                                .foregroundColor(.accentColor)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                    }
                    .padding(EdgeInsets(top: 12.0, leading: 40.0, bottom: 12.0, trailing: 40.0))
                    .tag("watching")
                    
                    Divider()
                        .padding(.leading, 24)
                    
                    NavigationLink(destination: AllSessionsView()) {
                        HStack(alignment: .center)
                        {
                            Text("Todos los vídeos")
                                .fontWeight(.semibold)
                                .foregroundColor(.accentColor)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                    }
                    .padding(EdgeInsets(top: 12.0, leading: 40.0, bottom: 12.0, trailing: 40.0))
                    .tag("all")
                    
                    Divider()
                        .padding(.leading, 24)
                }
                
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
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
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
