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
    @ObjectBinding private var imageLoader: ImageLoader
    
    ///
    private var session: Session

    var body: some View
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
                Text("Marcar como favorita")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
            .frame(height: 50)
            .background(Color.accentColor)
            .cornerRadius(6)
            .shadow(radius: 4)
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
        .padding([.leading, .trailing], 24)
        .onAppear()
        {
            self.imageLoader.requestImage()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }

    /**

    */
    internal init(for session: Session)
    {
        self.session = session
        self.imageLoader = ImageLoader(from: session.imageURL)
    }
    
    private func handleFavoriteButtonTap() -> Void
    {
        
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
