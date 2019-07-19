//
//  WebBrowser.swift
//  DubDub
//
//  Created by Adolfo Vera Blasco on 18/07/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//

import WebKit
import SwiftUI

internal struct WebBrowser: UIViewRepresentable
{
    internal func makeUIView(context: Context) -> WKWebView
    {
        return WKWebView(frame: .zero)
    }
    
    internal func updateUIView(_ webView: WKWebView, context: Context) -> Void
    {
        guard let wwdcURL = URL(string: "https://developer.apple.com/wwdc19/") else
        {
            return
        }
        
        let wwdcRequest = URLRequest(url: wwdcURL)
        
        webView.load(wwdcRequest)
    }
}

#if DEBUG
struct WebBrowser_Previews: PreviewProvider {
    static var previews: some View {
        WebBrowser()
    }
}
#endif
