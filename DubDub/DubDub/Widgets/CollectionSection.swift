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
    var body: some View
    {
        VStack
        {
            Text("Section Name")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            ScrollView
            {
                HStack
                {
                    ForEach(0...10) { _ in
                        Text("Video")
                    }
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
