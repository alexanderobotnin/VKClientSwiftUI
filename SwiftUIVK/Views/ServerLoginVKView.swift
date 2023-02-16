//  ServerLoginVKView.swift
//

import SwiftUI
import WebKit

struct ServerLoginVKView: UIViewRepresentable {
    
    
    fileprivate let navigationDelegate = WebViewNavigationDelegate()
    
    
    
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = navigationDelegate
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let request = buildAuthRequest() {
            uiView.load(request)
        }
        
    }
    
    private func buildAuthRequest() -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "oauth.vk.com"
        components.path = "/authorize"
        components.queryItems = [
            
            URLQueryItem(name: "client_id", value: "8002682"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "friends,groups,photos,offline,wall"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.131")
            
            //            URLQueryItem(name: "client_id", value: "7996248"),
            //            URLQueryItem(name: "scope", value: "friends,photos,wall,offline,groups"),
            //            URLQueryItem(name: "display", value: "mobile"),
            //            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            //            URLQueryItem(name: "response_type", value: "token"),
            //            URLQueryItem(name: "v", value: "5.81")
        ]
        
        return components.url.map { URLRequest(url: $0) }
    }
}

class WebViewNavigationDelegate: NSObject, WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse:
                 WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let
                responseFragments = url.fragment  else {
                    decisionHandler(.allow)
                    return
                }
        let authParams = responseFragments
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        
        guard let authTokenResponse = authParams["access_token"], let authUserIdResponse = authParams["user_id"] else {return}
        
        SessionSingletone.shared.token = authTokenResponse
        print("TOKEN TOKEN TOKEN: \(SessionSingletone.shared.token)")
        SessionSingletone.shared.userID = authUserIdResponse
        SessionSingletone.shared.logedIn = true
        
        
        
        decisionHandler(.cancel)
    }
    
    
    
    //    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
    //        guard let url = navigationResponse.response.url,
    //              url.path == "/blank.html",
    //              let fragment = url.fragment else {
    //            decisionHandler(.allow)
    //            return
    //        }
    //
    //        let params = fragment
    //            .components(separatedBy: "&")
    //            .map { $0.components(separatedBy: "=") }
    //            .reduce([String: String]()) { result, param in
    //                var dict = result
    //                let key = param[0]
    //                let value = param[1]
    //                dict[key] = value
    //
    //                return dict
    //            }
    //
    //        guard let token = params["access_token"],
    //              let userIdString = params["user_id"] //,
    //             // let _ = Int(userIdString)
    //        else {
    //            decisionHandler(.allow)
    //            return
    //        }
    //
    //
    //        SessionSingletone.shared.token = token
    //        SessionSingletone.shared.userID = userIdString
    //        SessionSingletone.shared.logedIn = true
    //
    //        decisionHandler(.cancel)
    //    }
    
}

