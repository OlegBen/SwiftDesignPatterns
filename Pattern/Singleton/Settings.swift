//
//  Settings.swift
//  Pattern
//
//  Created by Олег on 01.01.2021.
//  Copyright © 2021 Oleg Ben. All rights reserved.
//

import UIKit
import Foundation

final class Settings {
    static let shared = Settings()
    
    
    init() {
        print("Create singleton - Settings")
    }
    
    deinit {
        print("Remove singleton - Settings")
    }
    
    
    //MARK: Settings
    public var isFirstSettingActive: Bool = false
    public var isSecondSettingActive: Bool = false
    public var userComment: String = ""
}
