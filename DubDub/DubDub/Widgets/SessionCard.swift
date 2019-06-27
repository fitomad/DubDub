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
    var body: some View
    {
        VStack
        {
            Image("")
                .resizable()
                .cornerRadius(6)
                .shadow(radius: 12)
                .frame(height: 150)
            
            Text("macOS")
                .font(.footnote)
                .foregroundColor(.secondary)
            
            Text("")
                .fontWeight(.bold)
        }
    }
}

#if DEBUG
struct VideoCard_Previews : PreviewProvider {
    static var previews: some View {
        SessionCard()
    }
}
#endif
