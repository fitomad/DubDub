//
//  FavoriteCellView.swift
//  DubDub
//
//  Created by Adolfo Vera Blasco on 14/10/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//

import SwiftUI
import Foundation

import DubDubKit

internal struct FavoriteCellView: View
{
    ///
    @ObservedObject private var imageLoader: ImageLoader
    ///
    private var session: Favorites

    ///
    internal var body: some View
    {
        HStack(alignment: .center, spacing: 16)
        {
            Image(self.imageLoader.image ?? Image(named: "EmptyImage")!)
                .aspectRatio(1.77, contentMode: .fit) // Formato 16:9

            VStack(alignment: .leading, spacing: 8)
            {
                Text(self.session.formattedCreationDate)
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)

                Text(self.session.title)
                    .font(.system(.size: 16, weight: .bold))
                    .lineLimit(1)                    
            }
        }
        .onAppear() {
            self.imageLoader.requestImage()
        }
    }

    /**

    */
    internal init(for session: Favorites)
    {
        self.session = session

        self.imageLoader = ImageLoader(from: session.imageURL)
    }
}