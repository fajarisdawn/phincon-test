//
//  AppDelegate.swift
//  PhinconPokemon
//
//  Created by fajaradiwasentosa on 22/06/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let viewModel = HomeViewModel()
        let viewController = UINavigationController(rootViewController: HomeViewController(viewModel))
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        
        return true
    }
}

