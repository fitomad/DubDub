//
//  LaunchView
//  DubDub
//
//  Created by Adolfo Vera Blasco on 27/06/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//

import SwiftUI

internal struct LaunchView : View
{
    var body: some View
    {
        Text("Hello World")
    }
}

#if DEBUG
struct LaunchView_Previews : PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
#endif
