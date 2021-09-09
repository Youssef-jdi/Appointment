//
//  AppDelegate.swift
//  appointment
//
//  Created by Raluca Mesterca on 12/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit
//import CoreData
import FBSDKCoreKit
import Firebase
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private lazy var app = AppointmentApp()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.disableDarkMode()

        app.prepare()

        // MARK: Sync App
        setupFBSDK(application, launchOptions)
        setupGoogleSDK()

        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return handleAppSync(url, app, options)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        AppEvents.activateApp()
    }
}

// MARK: Sync App
private extension AppDelegate {

    func setupFBSDK(_ application: UIApplication, _ launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        ApplicationDelegate.shared.application(
            application,
            didFinishLaunchingWithOptions: launchOptions)
    }

    func setupGoogleSDK() {
        GIDSignIn.sharedInstance()?.clientID = "984897590199-1s9gc5fc08niddvk3p266fhnf58d3og8.apps.googleusercontent.com"
    }

    func handleAppSync(_ url: URL, _ app: UIApplication, _ options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool {
        // MARK: Yahoo sync
        if url.scheme == "appointment" {

            if url.absoluteString.contains("yahoo") {
                YahooService.shared.handleOAuthCallback(url: url)
                return true
            }

            // MARK: Outlook sync
            let service = OutlookService.shared()
            service.handleOAuthCallback(url: url)
            return true
        }

        let handledGoogle = GIDSignIn.sharedInstance()?.handle(url)
        let handledFacebook = ApplicationDelegate.shared.application(app, open: url, options: options)
        return handledGoogle ?? false || handledFacebook
    }
}
