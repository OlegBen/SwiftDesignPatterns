//
//  AdapterViewController.swift
//  Pattern
//
//  Created by Олег on 12.09.2021.
//  Copyright © 2021 Oleg Ben. All rights reserved.
//

import UIKit

class AdapterViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var encodedValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func encodeHandler(_ sender: UIButton) {
        guard let text = self.textView.text, !text.isEmpty else { return }
        /// Так как для кодировки sha256 требуется не строка, а преобразованные данные из нее, создаем адаптер, который сконвертирует необходимые данные из строки
        let adapter = ValueAdapter(value: text)
        /// Энкодер, для получения зашифрованного значения в кодировке sha256
        let sha256Encoder = SHA256Encoder()
        /// Для продолжения необходимо иметь данные
        guard let data = adapter.stringToUTF8Data() else { return }
        /// Записываем полученные зашифрованные данные
        self.encodedValueLabel.text = sha256Encoder.encode(data: data)
    }
}
