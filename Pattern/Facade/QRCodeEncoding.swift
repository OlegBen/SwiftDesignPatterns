//
//  QRCodeEncoding.swift
//  Pattern
//
//  Created by Олег on 12.09.2021.
//  Copyright © 2021 Oleg Ben. All rights reserved.
//

import UIKit
import CoreImage

/// Сложный класс, для генерации QR кода из текста
class QRCodeEncoding {
    /// Преобразование строки в данные
    /// - Parameter value: String
    /// - Returns: Data
    func getData(from value: String) -> Data? {
        return value.data(using: String.Encoding.utf8)
    }
    
    /// Получение фильтра
    /// - Parameter data: Data
    /// - Returns: CIFilter
    func getQRFilter(with data: Data) -> CIFilter? {
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter?.setValue(data, forKey: "inputMessage")
        return filter
    }
    
    /// Получение матрицы, для 2d представления
    /// - Parameters:
    ///   - x: CGFloat
    ///   - y: y CGFloat
    /// - Returns: CGAffineTransform
    func getAffineTransform(x: CGFloat, y: CGFloat) -> CGAffineTransform {
        return CGAffineTransform(scaleX: x, y: y)
    }
    
    /// Ваще сложный метод, требующий фильтра и матрицы, для представления изображения
    /// - Parameters:
    ///   - filter: CIFilter
    ///   - affineTransform: CGAffineTransform
    /// - Returns: UIImage
    func getQRImage(filter: CIFilter, affineTransform: CGAffineTransform) -> UIImage? {
        if let output = filter.outputImage?.transformed(by: affineTransform) {
            return UIImage(ciImage: output)
        } else {
            return nil
        }
    }
}
