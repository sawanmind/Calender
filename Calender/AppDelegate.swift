//
//  AppDelegate.swift
//  Calender
//
//  Created by iOS Developer on 1/2/18.
//  Copyright © 2018 sawanmind. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        if let window = self.window {
            window.backgroundColor = UIColor.white
            let nav = UINavigationController()
            let mainView = CalenderVC()
            nav.viewControllers = [mainView]
            window.rootViewController = nav
            window.makeKeyAndVisible()
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.font : UIFont.monospacedDigitSystemFont(ofSize: 16, weight: UIFont.Weight.black)]
        }
        return true
    }

}

