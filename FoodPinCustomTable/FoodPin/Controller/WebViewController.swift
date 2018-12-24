//
//  WebViewController.swift
//  FoodPin
//
//  Created by Arpik Sargsyan on 12/24/18.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    var targetURL = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // To prevent from using the large title 
        
        navigationItem.largeTitleDisplayMode = .never
        
        if let url = URL(string: targetURL) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
