//
//  CollectionSection.swift
//  DubDub
//
//  Created by Adolfo Vera Blasco on 27/06/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//

import SwiftUI

import CoreWWDC
import DubDubKit

internal struct CollectionSection : View
{
    ///
    @ObjectBinding private var collectionSessions: CollectionViewModel
    ///
    internal var collectionDetails: SpecialCollection

    var body: some View
    {
        VStack(alignment: .leading)
        {
            Text(collectionDetails.name)
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
 
                    ForEach(self.collectionSessions.sessions) { session in
                        NavigationButton(destination: SessionView(for: session))
                        {
                            SessionCard(for: session)
                        }
                    }
    
                    Spacer()
                        .frame(width: 16)
                }
            }
            .frame(height: 280)
        }
        
    }
    
    internal init(collectionDetails: SpecialCollection)
    {
        self.collectionDetails = collectionDetails
        self.collectionSessions = CollectionViewModel(sessionsTitled: collectionDetails.sessionTitles)
    }
}

#if DEBUG
struct CollectionSection_Previews : PreviewProvider {
    static var previews: some View {
        //CollectionSection()
        Text("")
    }
}
#endif
