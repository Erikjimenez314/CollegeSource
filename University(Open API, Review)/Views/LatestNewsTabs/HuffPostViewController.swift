//
//  HuffPostViewController.swift
//  University(Open API, Review)
//
//  Created by Erik Jimenez on 6/1/22.
//

import UIKit
import WebKit

class HuffPostViewController: UIViewController, WKNavigationDelegate {
    

    @IBOutlet weak var huffPostWebView: WKWebView!
    
    
    var webContent = """
<meta name='viewport' content='initial-scale=1.0'/>
<a class="twitter-timeline" href="https://twitter.com/huffpostcollege"> Tweets Huff Post College </a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
"""
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        huffPostWebView.navigationDelegate = self
        huffPostWebView.loadHTMLString(webContent, baseURL: nil)
        
        
    }
    
    var buttonOne: UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = .cyan
        button.setTitle("Dismiss", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.black, for: .normal)
        button.layer.shadowRadius = 20
        button.layer.borderWidth = 2
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.masksToBounds = false
        button.clipsToBounds = true
        return button
    }
    
    
    func setupConstraints() {
        view.addSubview(buttonOne)
        buttonOne.translatesAutoresizingMaskIntoConstraints = false
        buttonOne.heightAnchor.constraint(equalToConstant: 20).isActive = true
        buttonOne.widthAnchor.constraint(equalToConstant: 20).isActive = true
        buttonOne.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonOne.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200).isActive = true
    }
    
    
    private func huffPostWebView(_ huffPostWebView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
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
// install and apply dog controller to latest news controller, replace "latest news"
// finish desgin for tweets
// problem with API call is no api key

