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

        loadView()
    }
    
    override func loadView() {
        view = UIView()
        
        view.backgroundColor = UIColor(white: 0, alpha: 0.9)
        
        
        let spinner = UIActivityIndicatorView(style: .large)
        
        spinner.color = .white
        
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
