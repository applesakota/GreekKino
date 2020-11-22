//
//  WebExtractionViewController.swift
//  GreekKino
//
//  Created by Petar Sakotic on 11/21/20.
//  Copyright © 2020 Petar Sakotic. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class WebExtractionViewController: UIViewController {
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebView()

    }
}
//MARK: - WKNAvigationDelegate
extension WebExtractionViewController: WKNavigationDelegate {
    func loadWebView() {
        let url = URL(string: "https://ds.opap.gr/web_kino/kinoIframe.html?link=https://ds.opap.gr/web_kino/kino/html/Internet_PRODUCTION/KinoDraw_201910.html&resolution=847x500")
        webView.load(URLRequest(url: url!))
        webView.allowsBackForwardNavigationGestures = true
    }
}
