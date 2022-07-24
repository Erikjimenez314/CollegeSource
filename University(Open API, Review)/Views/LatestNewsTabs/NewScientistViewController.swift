//
//  NewScientistViewController.swift
//  University(Open API, Review)
//
//  Created by Erik Jimenez on 6/1/22.
//

import UIKit
import WebKit

class NewScientistViewController: UIViewController, WKNavigationDelegate {
    
    var webContent = """
<meta name='viewport' content='initial-scale=1.0'/>
<a class="twitter-timeline" href="https://twitter.com/newscientist"> Tweets New Scientist </a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
"""
    
    @IBOutlet weak var newScientistWebView: WKWebView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        newScientistWebView.navigationDelegate = self
        newScientistWebView.loadHTMLString(webContent, baseURL: nil)
        
    }
    
    private func newScientistWebView(_ newScientistWebView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
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

