//
//  SingletonViewController.swift
//  Pattern
//
//  Created by Олег on 04.01.2021.
//  Copyright © 2021 Oleg Ben. All rights reserved.
//

import UIKit

class SingletonViewController: UIViewController {
    @IBOutlet weak var firstSettingSwitch: UISwitch!
    @IBOutlet weak var secondSettingSwitch: UISwitch!
    @IBOutlet weak var commentTextView: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.checkValue()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTextView()
    }
    
    
    private func checkValue() {
        let settings = Settings.shared
        
        self.firstSettingSwitch.isOn = settings.isFirstSettingActive
        self.secondSettingSwitch.isOn = settings.isSecondSettingActive
        self.commentTextView.text = settings.userComment
    }
    
    private func setupTextView() {
        self.commentTextView.delegate = self
    }
    
    
    @IBAction func fisrtSettingSwitchChanged(_ sender: UISwitch) {
        Settings.shared.isFirstSettingActive = sender.isOn
    }
    
    @IBAction func secondSettingSwitchChanged(_ sender: UISwitch) {
        Settings.shared.isSecondSettingActive = sender.isOn
    }
}


//MARK: UITextViewDelegate - imp
extension SingletonViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        guard let comment = textView.text else { return }
        
        Settings.shared.userComment = comment
    }
}
