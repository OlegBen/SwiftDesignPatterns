//
//  ExerciseTableViewCell.swift
//  Pattern
//
//  Created by Олег on 05.01.2021.
//  Copyright © 2021 Oleg Ben. All rights reserved.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {
    @IBOutlet weak var exerciseTitle: UILabel!
    @IBOutlet weak var exercisePlayStopButton: UIButton!
    
    private var isPlayingNow: Bool = false
    private var exercise: Exercise?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setupCell(with exercise: Exercise) {
        self.exercise = exercise
        self.setupUI()
    }
    
    private func setupUI() {
        guard let exercise = self.exercise else { return }
        
        self.exerciseTitle.text = exercise.name
        self.exercisePlayStopButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
    }

    @IBAction func exercisePlayStopButtonAction(_ sender: UIButton) {
        guard let exercise = self.exercise else { return }
        
        //Change play state
        self.isPlayingNow = !self.isPlayingNow
        
        //Get image for button state
        let buttonImage: UIImage!
        
        if self.isPlayingNow {
            buttonImage = UIImage(systemName: "pause.fill")
            //Call start exercise method
            exercise.start()
        } else {
            buttonImage = UIImage(systemName: "play.fill")
            //Call stop exercise method
            exercise.stop()
        }
        
        //Set image for button state
        sender.setImage(buttonImage, for: .normal)
    }
}
