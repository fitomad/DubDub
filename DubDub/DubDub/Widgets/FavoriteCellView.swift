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
    private var session: Favorite

    ///
    internal var body: some View
    {
        HStack(alignment: .center, spacing: 16)
        {
            Image(uiImage: self.imageLoader.image ?? UIImage(named: "EmptyImage")!)
                .resizable()
                .aspectRatio(1.77, contentMode: .fit ) // Formato 16:9
                .cornerRadius(6)
                .frame(height: 75)
            
            VStack(alignment: .leading, spacing: 8)
            {
                Text(self.session.fomattedCreationDate)
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
                
                Text(self.session.name ?? "Untitled Session")
                    .font(.system(size: 16, weight: .bold))
                    .lineLimit(2)
            }
        }
        .onAppear() {
            self.imageLoader.requestImage()
        }
    }

    /**

    */
    internal init(for session: Favorite)
    {
        self.session = session
        self.imageLoader = ImageLoader(from: session.backdrop)
    }
}
