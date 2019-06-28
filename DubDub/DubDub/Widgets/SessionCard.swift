//
//  VideoCard.swift
//  DubDub
//
//  Created by Adolfo Vera Blasco on 27/06/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//

import SwiftUI

internal struct SessionCard : View
{
    ///
    @ObjectBinding private var imageLoader = imageLoader
    ///
    private sessionDetails: Session

    var body: some View
    {
        VStack(alignment: .leading)
        {
            Image("")
                .renderingMode(.original)
                .resizable()
                .cornerRadius(6)
                .shadow(radius: 8)
                .frame(height: 150)
            
            Text("macOS")
                .font(.footnote)
                .fontWeight(.regular)
                .foregroundColor(.secondary)
                .padding(EdgeInsets(top: 8, leading: 8, bottom: 4, trailing: 8))
            
            Text("Session name")
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 4, trailing: 8))
        }
        .frame(width: 270, height: 350, alignment: .leading)
        .padding(8)
        .onAppear() {
            self.imageLoader.requestImage()
        }
    }

    /**

    */
    internal init(for session: Session)
    {
        self.sessionDetails = session

        self.imageLoader = imageLoader(for: self.sessionDetails.)
    }
}

#if DEBUG
struct VideoCard_Previews : PreviewProvider {
    static var previews: some View {
        SessionCard()
    }
}
#endif
