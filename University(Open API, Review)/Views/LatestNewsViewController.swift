//
//  LatestNewsViewController.swift
//  University(Open API, Review)
//
//  Created by Erik Jimenez on 6/1/22.
//

import UIKit

class LatestNewsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: Outlets
    
    
    @IBAction func HuffPostTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "HuffPostViewController") as! HuffPostViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }
    @IBAction func BBCTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "BBCViewController") as! BBCViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    @IBAction func StudentUniverseTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "StudentUniverseViewController") as! StudentUniverseViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    @IBAction func NewScientistTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "NewScientistViewController") as! NewScientistViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
