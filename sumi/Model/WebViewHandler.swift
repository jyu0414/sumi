//
//  WebViewHandler.swift
//  sumi
//
//  Created by Yuji Sasaki on 2020/03/09.
//  Copyright © 2020 Yuji Sasaki. All rights reserved.
//

import WebKit

class WebViewHandler: NSObject, WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        let value = try! JSONDecoder().decode(TouchEvent.self, from: (message.body as! String).data(using: .utf8)!)
        print(value)
    }
    
    
}
