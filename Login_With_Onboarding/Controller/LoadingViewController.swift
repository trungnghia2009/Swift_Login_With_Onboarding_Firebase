//
//  LoadingViewController.swift
//  Login_With_Onboarding
//
//  Created by trungnghia on 4/30/20.
//  Copyright © 2020 trungnghia. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var darkView: UIView!
    
    
    //MARK: - Vars and Consts
    private let isUserLoggedIn = false
    
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        delay(seconds: 1, completion: showInitialView)
    }
    
    
    //MARK: - Setup
    private func setupView() {
        backgroundImage.image = UIImage(named: K.Image.loadingBackground)
        darkView.backgroundColor = UIColor.init(white: 0.1, alpha: 0.3)
    }
    
    
    //MARK: - Helpers
    private func showInitialView() {
        if isUserLoggedIn {
            PresenterManager.shared.show(vc: .mainTabBarController)
        } else {
            performSegue(withIdentifier: K.Segue.showOnboarding, sender: nil)
        }
        
    }


}
