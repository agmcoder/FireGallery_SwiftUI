//
//  Logger.swift
//  FireGallery_SwiftUI
//
//  Created by agmcoder on 6/2/23.
//

import Foundation
import os

class CLogger {
    let log: OSLog

    init(subsystem: String, category: String) {
        log = OSLog(subsystem: subsystem, category: category)
    }

    func log(_ message: String) {
        os_log("%@", log: log, type: .debug, message)
    }
}
