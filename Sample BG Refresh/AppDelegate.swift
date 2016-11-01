//
//  AppDelegate.swift
//  Sample BG Refresh
//
//  Created by iYrke on 11/1/16.
//  Copyright © 2016 iYrke. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var backgroundCompletion: ((UIBackgroundFetchResult) -> Void)?
    var downloader: Downloader?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        NotificationCenter.default.addObserver(self, selector: #selector(notificationPosted), name: NSNotification.Name(rawValue: "DownloadCompleted"), object: nil)
        return true
    }

    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        backgroundCompletion = completionHandler

        print("\(Date()): performFetchWithCompletion called, stored completion, starting download...")
        downloader = BackgroundDownloader()
        //downloader = ForegroundDownloader()
        downloader?.beginDownload()
    }

    func notificationPosted() {
        print("\(Date()): notification posted, running completion if available")
        backgroundCompletion?(.newData)
    }
}
