//
//  Slide.swift
//  Login_With_Onboarding
//
//  Created by trungnghia on 4/30/20.
//  Copyright © 2020 trungnghia. All rights reserved.
//

import Foundation

struct Slide {
    let image: String
    let title: String
    let description: String
    
    static let slidePlaceholder: [Slide] = [
        .init(image: "imSlide1", title: "Welcome to Trafel", description: "Trafel allows you to travel around the world, make new friends and create memorable expreriences."),
        .init(image: "imSlide2", title: "Connect Socially", description: "Connect across contients to strangers via the app."),
        .init(image: "imSlide3", title: "Safe and Secure", description: "Each trip is planned according to the strictest safety standards to ensure passenger safety."),
    ]
}
