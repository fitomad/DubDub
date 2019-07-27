//
//  WebBrowser.swift
//  DubDub
//
//  Created by Adolfo Vera Blasco on 18/07/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//

import WebKit
import SwiftUI

internal final class WebBrowser: NSObject, UIViewRepresentable
{
    /**
     
    */
    internal func makeUIView(context: Context) -> WKWebView
    {
        let webView = WKWebView(frame: .zero)
        webView.navigationDelegate = self
        
        return webView
    }
    
    /**
     
    */
    internal func updateUIView(_ webView: WKWebView, context: Context) -> Void
    {
        guard let wwdcURL = URL(string: "https://developer.apple.com/wwdc19/") else
        {
            return
        }
                
        let wwdcRequest = URLRequest(url: wwdcURL)
        
        webView.load(wwdcRequest)
    }
    
    /**
     
     
    */
    private func loadErrorPage(in webView: WKWebView) -> Void
    {
        guard let htmlURL = Bundle.main.url(forResource: "HTMLError", withExtension: "html"),
              let htmlData = try? Data(contentsOf: htmlURL),
              let htmlString = String(data: htmlData, encoding: .utf8)
        else
        {
            return
        }
        
        webView.loadHTMLString(htmlString, baseURL: nil)
    }
}

extension WebBrowser: WKNavigationDelegate
{
    // Fallo durante la carga
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error)
    {
        self.loadErrorPage(in: webView)
    }
    
    // Fallo al intentar cargar
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error)
    {
        self.loadErrorPage(in: webView)
    }
}

#if DEBUG
struct WebBrowser_Previews: PreviewProvider {
    static var previews: some View {
        WebBrowser()
    }
}
#endif
