//
//  WebView.swift
//  101-connect
//
//  Created by incetro on 1/14/22.
//

import SwiftUI
import WebKit

// MARK: - WebView

struct WebView: UIViewRepresentable {

    // MARK: - Properties

    /// Target url address
    let url: URL

    // MARK: - UIViewRepresentable

    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
