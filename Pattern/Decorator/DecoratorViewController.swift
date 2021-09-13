//
//  DecoratorViewController.swift
//  Pattern
//
//  Created by Олег on 13.09.2021.
//  Copyright © 2021 Oleg Ben. All rights reserved.
//

import UIKit

class DecoratorViewController: UIViewController {
    @IBOutlet weak var aboutSetOfFurnitureLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    private var setOfFurniture: SetOfFurniture?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setOfFurniture = StartingSetOfFurniture()
        /// Для настойки информации о комплекте, необходимо иметь стартовый набор мебели
        self.setupSetInfo()
        self.setupSetCost()
    }
    
    func setupSetInfo() {
        guard let set = self.setOfFurniture else { return }
        self.aboutSetOfFurnitureLabel.text = set.getSetDescription()
    }
    
    func setupSetCost() {
        guard let set = self.setOfFurniture else { return }
        self.amountLabel.text = "Стоимость: \(String(set.cost)) рублей"
    }
    
    @IBAction func addNewFurnitureHandler(_ sender: UIButton) {
        let actionSheet = UIAlertController(title: "Доступная мебель", message: nil, preferredStyle: .actionSheet)
        
        let addTableAction = UIAlertAction(title: "Стол", style: .default) { [weak self] (action) in
            guard let _self = self, let set = _self.setOfFurniture else { return }
            _self.setOfFurniture = SetOfFurnitureWithTable(set)
            _self.setupSetInfo()
            _self.setupSetCost()
        }
        let addFourChairsAction = UIAlertAction(title: "4 стула", style: .default) { [weak self] (action) in
            guard let _self = self, let set = _self.setOfFurniture else { return }
            _self.setOfFurniture = SetOfFurnitureWithFourChairs(set)
            _self.setupSetInfo()
            _self.setupSetCost()
        }
        let addTwoChairsAction = UIAlertAction(title: "2 стула", style: .default) { [weak self] (action) in
            guard let _self = self, let set = _self.setOfFurniture else { return }
            _self.setOfFurniture = SetOfFurnitureWithTwoChairs(set)
            _self.setupSetInfo()
            _self.setupSetCost()
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        actionSheet.addAction(addTableAction)
        actionSheet.addAction(addFourChairsAction)
        actionSheet.addAction(addTwoChairsAction)
        actionSheet.addAction(cancelAction)
        
        self.navigationController?.present(actionSheet, animated: true, completion: nil)
    }
    
}
