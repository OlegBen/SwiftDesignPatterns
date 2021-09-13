//
//  FactoryViewController.swift
//  Pattern
//
//  Created by Олег on 04.01.2021.
//  Copyright © 2021 Oleg Ben. All rights reserved.
//

import UIKit

class FactoryViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    private var dataSource = [Exercise]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTableView()
    }
    
    private func setupTableView() {
        self.table.delegate = self
        self.table.dataSource = self
        self.table.rowHeight = 80
        self.table.tableFooterView = UIView()
    }
    
    @IBAction func addExerciseButtonAction(_ sender: UIButton) {
        self.showNewExerciseActionSheet()
    }
}

//MARK: UITableViewDataSource - imp
extension FactoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseTableViewCell") as! ExerciseTableViewCell
        let exercise = self.dataSource[indexPath.row]
        
        cell.setupCell(with: exercise)
        
        return cell
    }
}

//MARK: UITableViewDelegate - imp
extension FactoryViewController: UITableViewDelegate {
    
}

//MARK: Action sheet
extension FactoryViewController {
    private func showNewExerciseActionSheet() {
        let actionSheet = UIAlertController(title: "Выберите упражнение", message: nil, preferredStyle: .actionSheet)
        
        let squartsAction = UIAlertAction(title: "Приседания", style: .default) { [weak self] (action) in
            self?.addNewExercise(type: .squarts)
        }
        let jumpingAction = UIAlertAction(title: "Прыжки", style: .default) { [weak self] (action) in
            self?.addNewExercise(type: .jumping)
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        actionSheet.addAction(squartsAction)
        actionSheet.addAction(jumpingAction)
        actionSheet.addAction(cancelAction)
        
        self.navigationController?.present(actionSheet, animated: true, completion: nil)
    }
    
    private func addNewExercise(type: Exersices) {
        let newExercise = ExercisesFactory.createExercise(type: type)
        self.dataSource.append(newExercise)
        self.table.reloadData()
    }
}
