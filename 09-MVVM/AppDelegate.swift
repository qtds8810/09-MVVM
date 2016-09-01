//
//  AppDelegate.swift
//  09-MVVM
//
//  Created by 左得胜 on 16/9/1.
//  Copyright © 2016年 左得胜. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor = UIColor.whiteColor()
        
        let vc = MainViewController()
        let nav = UINavigationController(rootViewController: vc)
        window?.rootViewController = nav
        
        window?.makeKeyAndVisible()
        return true
    }

    
}

