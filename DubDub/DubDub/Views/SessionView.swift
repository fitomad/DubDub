//
//  SessionView.swift
//  DubDub
//
//  Created by Adolfo Vera Blasco on 27/06/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//

import SwiftUI

internal struct SessionView : View
{
    ///
    @ObjectBinding private var imageLoader: ImageLoader

    var body: some View
    {
        VStack
        {
            Image("")
                .resisable()
                .aspectToFit()
                .cornerRadius(6)
                .shadow(radius: 8)
                .frame(height: 150)

            Text("operationg systems")
                .font(.footnote)
                .foregroundColor(.secondary)

            Text("Session name")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)

            Text("Overview")
                .font(.system(size: 22, weight: .bold))
            
            Text("sadfasdfd")
                .lineLimit(nil)
                .lineHeight(1.5)

            Button(action: )
        }
        .onAppear() {
            self.imageLoader.requestImage()
        }
    }

    /**

    */
    internal init(for session: Session)
    {
        self.sessionModel = SessionViewModel(for: session)
        self.imageLoader = ImageLoader()
    }
}

#if DEBUG
struct SessionView_Previews : PreviewProvider {
    static var previews: some View {
        SessionView()
    }
}
#endif
