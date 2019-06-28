//
//  VideosView.swift
//  DubDub
//
//  Created by Adolfo Vera Blasco on 27/06/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//

import SwiftUI

internal struct VideosView : View
{
    ///
    @ObjectBinding private var collectionList: VideosViewModel()

    var body: some View
    {
        List
        {
            NavigationButton(destination: LandmarkList()) {
                Text("Favoritos")
                    .fontWeight(.semibold)
                    .foregroundColor(.accentColor)
            }

            NavigationButton(destination: LandmarkList()) {
                Text("Todos los vídeos")
                    .fontWeight(.semibold)
                    .foregroundColor(.accentColor)
            }

            NavigationButton(destination: LandmarkList()) {
                Text("Todos los vídeos")
                    .fontWeight(.semibold)
                    .foregroundColor(.accentColor)
            }

            // Colecciones
            ForEach(collectionList.collections) { collection in 
                CollectionSection(collectionDetails: collection)
            }
            .listRowInsets(EdgeInsets())
        }
    }
}

#if DEBUG
struct VideosView_Previews : PreviewProvider {
    static var previews: some View {
        VideosView()
    }
}
#endif
