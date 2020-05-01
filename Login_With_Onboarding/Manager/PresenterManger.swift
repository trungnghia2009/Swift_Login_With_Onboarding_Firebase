//
//  PresenterManger.swift
//  Login_With_Onboarding
//
//  Created by trungnghia on 4/30/20.
//  Copyright © 2020 trungnghia. All rights reserved.
//

import UIKit

class PresenterManager {
    
    static let shared = PresenterManager()
    
    private init() {}
    
    enum VC {
        case mainTabBarController
        case onboarding
    }
    
    func show(vc: VC) {
        
        var viewController: UIViewController
        
        switch vc {
        case .mainTabBarController:
            viewController = UIStoryboard.init(name: K.StoryboardID.main, bundle: nil).instantiateViewController(identifier: K.StoryboardID.mainTabBarController)
        case .onboarding:
            viewController = UIStoryboard(name: K.StoryboardID.main, bundle: nil).instantiateViewController(identifier: K.StoryboardID.onboardingViewController)
        }
        
        if let sceneDelegate =  UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate, let window = sceneDelegate.window  {
            window.rootViewController = viewController
            UIView.transition(with: window, duration: 0.25, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
        
    }

    
}

