//
//  AppDelegate.swift
//  EasyMath
//
//  Created by Federico Miguel Huguet Mack on 10/19/17.
//  Copyright © 2017 Federico Miguel Huguet Mack. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        let storyBoard = grabStoryboard()// Change the storyboard name based on the device, you may need to write a condition here for that
        let initialViewController: UIViewController = storyBoard.instantiateInitialViewController()!
        self.window?.rootViewController = initialViewController
        self.window?.makeKeyAndVisible()
        
        UINavigationBar.appearance().barTintColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.4)
        UINavigationBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.black]
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    func grabStoryboard() -> UIStoryboard {
        let screenHeight = Int(UIScreen.main.bounds.size.height)
        print(screenHeight)
        var storyboard : UIStoryboard
        
        switch screenHeight {
        case 568:
            storyboard = UIStoryboard(name: "Main-SE", bundle: nil)
            break;
        case 736:
            storyboard = UIStoryboard(name: "Main-8Plus", bundle: nil)
            break;
        default:
            storyboard = UIStoryboard(name: "Main", bundle: nil)
            break;
        }
        return storyboard
    }
    

}

