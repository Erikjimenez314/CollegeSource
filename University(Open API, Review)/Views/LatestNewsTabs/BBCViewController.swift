//
//  BBCViewController.swift
//  University(Open API, Review)
//
//  Created by Erik Jimenez on 6/1/22.
//


import UIKit
import WebKit

class BBCViewController: UIViewController, WKNavigationDelegate {
    

    @IBOutlet weak var bbcWebView: WKWebView!
    
    var webContent = """
<meta name='viewport' content='initial-scale=1.0'/>
<a class="twitter-timeline" href="https://twitter.com/bbceducation"> Tweets BBC Education </a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
"""
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        bbcWebView.navigationDelegate = self
        bbcWebView.loadHTMLString(webContent, baseURL: nil)
        
    }
    
    private func bbcWebView(_ bbcWebView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        if navigationAction.navigationType == .linkActivated {
            if let url = navigationAction.request.url,
               UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
                print(url)
                print("Redirected To Browser, No Need To Open Locally!")
                decisionHandler(.cancel)
            } else {
                print("Open It Locally")
                decisionHandler(.allow)
            }
        } else {
            print("This Is Not A User Click!")
            decisionHandler(.allow)
        }
    }
    
}
