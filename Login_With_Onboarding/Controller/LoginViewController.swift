//
//  LoginViewController.swift
//  Login_With_Onboarding
//
//  Created by trungnghia on 5/1/20.
//  Copyright © 2020 trungnghia. All rights reserved.
//

import UIKit
import MBProgressHUD

class LoginViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmationTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    private enum PageType {
        case login
        case signup
    }
    
    //MARK: - Vars and Consts
    private var currentPageType: PageType = .login {
        didSet {
             setupViewFor(pageType: currentPageType)
        }
    }
    
    private var errorMessage: String? {
        didSet {
            showErrorMessageIfNeeded(text: errorMessage)
        }
    }
    
    private var isSuccessfulLogin = true
    
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewFor(pageType: currentPageType)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailTextField.becomeFirstResponder()
    }
    
    
    //MARK: - IBActions
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        currentPageType = sender.selectedSegmentIndex == 0 ? .login : .signup
        
    }
    
    @IBAction func forgetPasswordButtonTapped(_ sender: Any) {
    
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        view.endEditing(false)
        MBProgressHUD.showAdded(to: view, animated: true)
        delay(seconds: 2.0) {
            MBProgressHUD.hide(for: self.view, animated: true)
            if self.isSuccessfulLogin {
                self.dismiss(animated: true) {
                    PresenterManager.shared.show(vc: .mainTabBarController)
                }
            } else {
                self.errorMessage = "Your Password is invalid. Please check yourself"
            }
        }
        
        
    }
    
    
    //MARK: - Setup
    private func setupViewFor(pageType: PageType) {
        errorLabel.text = nil
        passwordConfirmationTextField.isHidden = (pageType == .login)
        forgetPasswordButton.isHidden = (pageType == .signup)
        signupButton.isHidden = (pageType == .login)
        loginButton.isHidden = (pageType == .signup)
        
    }
    
    //MARK: - Helper
    private func showErrorMessageIfNeeded(text: String?) {
        errorLabel.isHidden = text == nil
        errorLabel.text = text
    }

}
