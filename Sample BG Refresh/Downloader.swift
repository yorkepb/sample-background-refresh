//
//  Downloader.swift
//  Sample BG Refresh
//
//  Created by iYrke on 11/1/16.
//  Copyright © 2016 iYrke. All rights reserved.
//

import Foundation
import UIKit

protocol Downloader: NSObjectProtocol  {
    func beginDownload()
}

class BaseDownloader: NSObject, URLSessionDownloadDelegate, Downloader {
    var urlSession: URLSession?
    var delegateCallCount = 0
    var task: UIBackgroundTaskIdentifier?

    func beginDownload() {
        task = UIApplication.shared.beginBackgroundTask(withName: "name") {
            print("\(Date()): WARNING: Expiration Handler Called... Ending Task and calling completion")
            self.cleanup()

            //when the expiration handler is called make sure the notification is posted for the purpose of running the completion
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "DownloadCompleted"), object: nil)
        }


        guard let url = URL(string: "https://www.google.com") else { return }

        print("\(Date()): Beginning download of url: \(url)")
        urlSession?.downloadTask(with: url).resume()
    }

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        guard let url = URL(string: "https://www.google.com") else { return } // In order for this to really demonstrate how it works make sure this is a download of several MB

        let urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 30.0)

        DispatchQueue.main.async {
            self.delegateCallCount += 1
            print("\(Date()): Got a call back to didFinishDownloading new call count: \(self.delegateCallCount)")

            if self.delegateCallCount > 20 {
                self.cleanup()
                print("\(Date()): URLSession didFinishDownloadingTo: \(location)")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "DownloadCompleted"), object: nil)
            }

            if self.delegateCallCount == 1 {
                self.urlSession?.downloadTask(with: urlRequest).resume()
                self.urlSession?.downloadTask(with: urlRequest).resume()
                self.urlSession?.downloadTask(with: urlRequest).resume()
                self.urlSession?.downloadTask(with: urlRequest).resume()
                self.urlSession?.downloadTask(with: urlRequest).resume()
                self.urlSession?.downloadTask(with: urlRequest).resume()
                self.urlSession?.downloadTask(with: urlRequest).resume()
                self.urlSession?.downloadTask(with: urlRequest).resume()
                self.urlSession?.downloadTask(with: urlRequest).resume()
                self.urlSession?.downloadTask(with: urlRequest).resume()
                self.urlSession?.downloadTask(with: urlRequest).resume()
                self.urlSession?.downloadTask(with: urlRequest).resume()
                self.urlSession?.downloadTask(with: urlRequest).resume()
                self.urlSession?.downloadTask(with: urlRequest).resume()
                self.urlSession?.downloadTask(with: urlRequest).resume()
                self.urlSession?.downloadTask(with: urlRequest).resume()
                self.urlSession?.downloadTask(with: urlRequest).resume()
                self.urlSession?.downloadTask(with: urlRequest).resume()
                self.urlSession?.downloadTask(with: urlRequest).resume()
                self.urlSession?.downloadTask(with: urlRequest).resume()
            }
        }
    }

    func cleanup() {
        guard let task = task else { return }

        print("\(Date()): Ending Background Task")
        UIApplication.shared.endBackgroundTask(task)
        self.task = UIBackgroundTaskInvalid
    }
}
