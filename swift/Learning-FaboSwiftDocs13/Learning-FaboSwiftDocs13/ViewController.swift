//
//  ViewController.swift
//  Learning-FaboSwiftDocs13
//
//  Created by 小室沙央里 on 2022/09/14.
//
// ①プレビュー画面にエフェクト処理、UIWebViewでWebページを表示(ViewController)　※WKWebViewへ移行済


import UIKit
import WebKit

class ViewController: UIViewController {
    
    //
    var webView: WKWebView!
    
    override func loadView() {
        
        // WKWebViewConfigurationの生成
        let webConfiguration = WKWebViewConfiguration()
        
        // WKWebView に Configuration を引き渡し initialize
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        
        // WKUIDelegate の移譲先として self を登録
        webView?.uiDelegate = self
        
        // WKNavigationDelegate の移譲先として self を登録
        webView?.navigationDelegate = self
        
        // view に webView を割り当て
        view = webView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // URLオブジェクトを生成
        let myURL = URL(string: "https://www.apple.com")
        
        // URLRequestオブジェクトを生成
        let myRequest = URLRequest(url: myURL!)
        
        // URLを WebView にロード
        webView.load(myRequest)
    }


}


extension ViewController: WKUIDelegate {
    // delegate
}

extension ViewController: WKNavigationDelegate {
    // delegate
}
