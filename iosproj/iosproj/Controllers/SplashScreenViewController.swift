//
//  ViewController.swift
//  iosproj
//
//  Created by Jacky LIM on 15/12/2020.
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    let numberOfTapeToRedirect: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(redirect))
        
        tapGestureRecognizer.numberOfTapsRequired = self.numberOfTapeToRedirect
        
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(tapGestureRecognizer)
        
    
    }
    
    @objc func redirect() {
        print("Hello")
        let vc = PokemonListViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    

}

