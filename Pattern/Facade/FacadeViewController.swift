//
//  FacadeViewController.swift
//  Pattern
//
//  Created by Олег on 12.09.2021.
//  Copyright © 2021 Oleg Ben. All rights reserved.
//

import UIKit

class FacadeViewController: UIViewController {
    @IBOutlet weak var qrImageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func generateQRHandler(_ sender: UIButton) {
        guard let text = self.textView.text, !text.isEmpty else { return }
        let qrCodeEncoding = QRCodeEncodingFacade()
        qrCodeEncoding.generateQRCode(value: text, imageView: self.qrImageView)
    }
}
