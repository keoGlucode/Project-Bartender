//
//  LoadingViewController.swift
//  Bartender
//
//  Created by Keo Shiko on 2021/03/25.
//  Copyright © 2021 Glucode. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        view = UIView()
        
        view.backgroundColor = UIColor(white: 5, alpha: 1.0)
        
        
        let spinner = UIActivityIndicatorView(style: .large)
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        
        spinner.startAnimating()
        
        
        view.addSubview(spinner)
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
