//
//  VideoCard.swift
//  DubDub
//
//  Created by Adolfo Vera Blasco on 27/06/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//

import SwiftUI

import DubDubKit
import CoreWWDC

internal struct SessionCard : View
{
    ///
    @ObservedObject private var imageLoader: ImageLoader
    ///
    internal var session: Session

    var body: some View
    {
        VStack(alignment: .leading)
        {
            Image(uiImage: self.imageLoader.image ?? UIImage(named: "EmptyImage")!)
                .renderingMode(.original)
                .resizable()
                .cornerRadius(6)
                .shadow(radius: 8)
                .frame(height: 150)
            
            Text(session.platforms.map({ $0.rawValue }).joined(separator: ", "))
                .font(.footnote)
                .fontWeight(.regular)
                .foregroundColor(.secondary)
                .padding(EdgeInsets(top: 8, leading: 8, bottom: 4, trailing: 8))
            
            Text(session.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .lineLimit(1)
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 4, trailing: 8))
        }
        .padding(8)
        .frame(width: 270, height: 260, alignment: .leading)
        .onAppear()
        {
            self.imageLoader.requestImage()
        }
    }
    
    internal init(for session: Session)
    {
        self.session = session
        self.imageLoader = ImageLoader(from: session.imageURL)
    }
}

#if DEBUG
struct VideoCard_Previews : PreviewProvider {
    static var previews: some View {
        //SessionCard(for: )
        Text("")
    }
}
#endif
