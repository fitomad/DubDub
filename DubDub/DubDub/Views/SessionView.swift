//
//  SessionView.swift
//  DubDub
//
//  Created by Adolfo Vera Blasco on 27/06/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//

import SwiftUI

import DubDubKit
import CoreWWDC

internal struct SessionView : View
{
    ///
    @ObservedObject private var imageLoader: ImageLoader
    ///
    @ObservedObject private var sessionModel: SessionViewModel
    
    ///
    private var session: Session

    var body: some View
    {
        ScrollView([ .vertical ], showsIndicators: false)
        {
            VStack(alignment: .leading)
            {
                Image(uiImage: self.imageLoader.image ?? UIImage(named: "EmptyImage")!)
                    .resizable()
                    .cornerRadius(6)
                    .shadow(radius: 8)
                    .frame(height: 200)
                    .padding(.bottom, 24)

                Text(self.session.platforms.map({ $0.rawValue }).joined(separator: ", "))
                    .font(.footnote)
                    .foregroundColor(.secondary)
     
                Text(session.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .lineLimit(3)
                    .padding([.top, .bottom], 12)
                
                Button(action: self.handleFavoriteButtonTap) {
                    Text(self.sessionModel.isFavorite ? "Quitar de Favoritos" : "Marcar como favorita")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(self.sessionModel.isFavorite ? .accentColor : .white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                }
                .frame(height: 50)
                .background(self.sessionModel.isFavorite ? Color.white : Color.accentColor)
                .cornerRadius(6)
                .shadow(radius: self.sessionModel.isFavorite ? 0 : 4)
                .padding([.top, .bottom], 24)

                Text("Resumen")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                
                Text(session.overview)
                    .font(.body)
                    .lineLimit(nil)
                    .lineSpacing(7)
                    .padding(.top, 12)
            }

            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        }
        .padding([.leading, .trailing], 24)
        .onAppear()
        {
            self.imageLoader.requestImage()
        }
    }

    /**

    */
    internal init(for session: Session)
    {
        self.session = session
        // 
        self.imageLoader = ImageLoader(from: session.imageURL)
        self.sessionModel = SessionViewModel(forSession: session)
    }
    
    /**

    */
    private func handleFavoriteButtonTap() -> Void
    {
        self.sessionModel.isFavorite.toggle()
    }
}

#if DEBUG
struct SessionView_Previews : PreviewProvider {
    static var previews: some View {
        //SessionView()
        Text("")
    }
}
#endif
