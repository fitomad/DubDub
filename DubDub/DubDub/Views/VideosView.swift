//
//  VideosView.swift
//  DubDub
//
//  Created by Adolfo Vera Blasco on 27/06/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//

import SwiftUI

internal struct VideosView : View
{
    var body: some View
    {
        
        Form
        {
            Section
            {
            List
            {
                Text("Op 1")
                Text("Op 2")
            }
            }
        }
    }
}

#if DEBUG
struct VideosView_Previews : PreviewProvider {
    static var previews: some View {
        VideosView()
    }
}
#endif
