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
        let store = MTMovieDataStore()
        store.searchTerm = "batman"
        store.sendCall { movies in
            print(movies)
        }
        return true
    }
}

