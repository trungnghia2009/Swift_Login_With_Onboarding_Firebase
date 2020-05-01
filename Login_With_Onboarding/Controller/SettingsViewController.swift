//
//  SettingsViewController.swift
//  Login_With_Onboarding
//
//  Created by trungnghia on 4/30/20.
//  Copyright © 2020 trungnghia. All rights reserved.
//

import UIKit
import MBProgressHUD

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        
    }
    
    //MARK: - IBActions
    @IBAction func logoutButtonTapped(_ sender: UIBarButtonItem) {
        MBProgressHUD.showAdded(to: view, animated: true)
        delay(seconds: 1.0) {
            PresenterManager.shared.show(vc: .onboarding)
        }
        
    }
    

}
