//
//  AppDelegate.swift
//  SearchMovie
//
//  Created by Christopher Webb-Orenstein on 3/21/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        MTAPIClient.search(for: "batman", forPage: "5") { movieData in
            print(movieData?.response)
            print(movieData?.movies)
            
        }
        return true
    }
}

