//
//  CollectionSection.swift
//  DubDub
//
//  Created by Adolfo Vera Blasco on 27/06/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//

import SwiftUI

internal struct CollectionSection : View
{
    ///
    internal private(set) collectionDetails: Collection

    var body: some View
    {
        VStack
        {
            Text("Section Name")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding([ .leading, .trailing], 32)
                .padding(.top, 24)
            
            ScrollView(showsHorizontalIndicator: false)
            {
                HStack
                {
                    Spacer()
                        .frame(width: 16)

                    ForEach(collectionDetails.sessions) { session in
                        SessionCard(sessionDetails: session)
                    }

                    Spacer()
                        .frame(width: 16)
                }
            }
        }
    }
}

#if DEBUG
struct CollectionSection_Previews : PreviewProvider {
    static var previews: some View {
        CollectionSection()
    }
}
#endif
