//
//  FavoritesView.swift
//  DubDub
//
//  Created by Adolfo Vera Blasco on 28/06/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//

import SwiftUI

internal struct FavoritesView : View
{
    var body: some View
    {
        Text("Tendrás que esperar a próximos artículos para ver qué ocurre aquí")
            .font(.title)
            .lineLimit(nil)
            .lineSpacing(8)
            .padding([.leading, .trailing], 32)
    }
}

#if DEBUG
struct FavoritesView_Previews : PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
#endif
