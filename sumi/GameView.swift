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
    var body: some View {
        WebView().navigationBarTitle("title", displayMode: .inline).edgesIgnoringSafeArea(.all)
    }
}

struct WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView
    var url: URL = URL(string: "https://sasaki.dev/")!
    var handler = WebViewHandler()
    
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WebView.UIViewType {
        
        let scriptSource = Bundle.main.path(forResource: "InjectionScript", ofType: "js") ?? ""
        let scriptText = try? String(contentsOfFile: scriptSource, encoding: String.Encoding.utf8)
        let config = WKWebViewConfiguration()
        let userController:WKUserContentController = WKUserContentController()
        userController.add(handler, name: "touchHandler")
        let script = WKUserScript(source: scriptText ?? "", injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        userController.addUserScript(script)
        config.userContentController = userController
        return WKWebView(frame: .zero, configuration: config)
    }
    
    func updateUIView(_ uiView: WebView.UIViewType, context: UIViewRepresentableContext<WebView>) {
        uiView.load(URLRequest(url: url))
    }
}

class WebViewHandler: NSObject, WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        let value = try! JSONDecoder().decode(TouchEvent.self, from: (message.body as! String).data(using: .utf8)!)
        print(value)
    }
}
