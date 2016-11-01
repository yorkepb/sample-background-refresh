//
//  ForegroundDownloader.swift
//  Sample BG Refresh
//
//  Created by iYrke on 11/1/16.
//  Copyright © 2016 iYrke. All rights reserved.
//

import Foundation

class ForegroundDownloader: BaseDownloader {
    override init() {
        super.init()
        self.urlSession = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
    }
}
