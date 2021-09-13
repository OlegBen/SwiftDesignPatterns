//
//  ValueAdapter.swift
//  Pattern
//
//  Created by Олег on 12.09.2021.
//  Copyright © 2021 Oleg Ben. All rights reserved.
//

import Foundation

// MARK: ValueAdapterProtocol
protocol ValueAdapterProtocol {
    func stringToUTF8Data() -> Data?
}

// MARK: ValueAdapter
class ValueAdapter: ValueAdapterProtocol {
    private var stringValue: String?
    
    /// Инициализатор для конвертации String значений
    /// - Parameter value: String
    init(value: String) {
        self.stringValue = value
    }
    
    /// Преобрахование String в данные
    /// - Returns: Data
    func stringToUTF8Data() -> Data? {
        return self.stringValue?.data(using: String.Encoding.utf8)
    }
}
