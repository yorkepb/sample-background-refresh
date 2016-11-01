//
//  BackgroundDownloader.swift
//  Sample BG Refresh
//
//  Created by iYrke on 11/1/16.
//  Copyright © 2016 iYrke. All rights reserved.
//

import Foundation

class BackgroundDownloader: BaseDownloader {
    override init() {
        super.init()
        let configuration = URLSessionConfiguration.background(withIdentifier: "background")
        self.urlSession = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }
}
