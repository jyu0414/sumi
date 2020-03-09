//
//  GameView.swift
//  sumi
//
//  Created by Yuji Sasaki on 2020/03/08.
//  Copyright © 2020 Yuji Sasaki. All rights reserved.
//

import SwiftUI
import WebKit

struct GameView: View {
    var game: Game
    var body: some View {
        VStack {
            WebView(url: game.path).edgesIgnoringSafeArea(.bottom)
        }.navigationBarHidden(false).navigationBarTitle(game.title)
    }
}

struct WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView
    var url: URL
    var handler = WebViewHandler()
    
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WebView.UIViewType {
        
        let scriptSource = Bundle.main.path(forResource: "InjectionScript", ofType: "js") ?? ""
        let scriptText = try? String(contentsOfFile: scriptSource, encoding: String.Encoding.utf8)
        let config = WKWebViewConfiguration()
        let userController:WKUserContentController = WKUserContentController()
        userController.add(handler, name: "touchHandler")
        let script = WKUserScript(source: scriptText ?? "", injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        userController.addUserScript(script)
        config.processPool = WKProcessPool()
        config.userContentController = userController
        config.applicationNameForUserAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.5 Safari/605.1.15"
        let webView = WKWebView(frame: .zero, configuration: config)
        return webView
    }
    
    func updateUIView(_ uiView: WebView.UIViewType, context: UIViewRepresentableContext<WebView>) {
        uiView.load(URLRequest(url: url))
    }
}
