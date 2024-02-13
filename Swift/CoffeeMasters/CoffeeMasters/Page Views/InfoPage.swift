//
//  InfoPage.swift
//  CoffeeMasters
//
//  Created by Maxim Villivald on 9.2.2024.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let url = URL(string: "https://firtman.github.io/coffeemasters/webapp")
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
    func executeJavaSCript(webView: WKWebView) {
        webView.evaluateJavaScript("alert('hello from Swift')")
    }
}

struct InfoPage: View {
    var body: some View {
        WebView()
    }
}

#Preview {
    InfoPage()
}
