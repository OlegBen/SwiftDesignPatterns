//
//  QRCodeEncodingFacade.swift
//  Pattern
//
//  Created by Олег on 12.09.2021.
//  Copyright © 2021 Oleg Ben. All rights reserved.
//

import UIKit

// MARK: QRCodeIncodingFacadeProtocol
protocol QRCodeIncodingFacadeProtocol {
    /// Генерация QR кода
    func generateQRCode(value: String, imageView: UIImageView)
}

class QRCodeEncodingFacade: QRCodeIncodingFacadeProtocol {
    func generateQRCode(value: String, imageView: UIImageView) {
        let qrCodeEncoding = QRCodeEncoding()
        /// Для продолжения выполнения кода, необходимо получить данные
        guard let data = qrCodeEncoding.getData(from: value) else { return }
        /// Для продолжения выполнения кода, необходимо получить фильтр
        guard let filter = qrCodeEncoding.getQRFilter(with: data) else { return }
        /// Получаем матрицу представления
        let affineTransform = qrCodeEncoding.getAffineTransform(x: 3, y: 3)
        /// Устанавливаем картинку с QR кодом
        imageView.image = qrCodeEncoding.getQRImage(filter: filter, affineTransform: affineTransform)
    }
}
