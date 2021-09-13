//
//  Exercise.swift
//  Pattern
//
//  Created by Олег on 01.01.2021.
//  Copyright © 2021 Oleg Ben. All rights reserved.
//

import UIKit

//MARK: Exersices types
enum Exersices {
    case jumping, squarts
}

//MARK: Abstract exercise
protocol Exercise {
    var name: String { get }
    var type: String { get }
    
    func start()
    func stop()
}

//MARK: Exercises
class Squarts: Exercise {
    var name: String = "Приседания"
    
    var type: String = "Упражнения для ног"
    
    func start() {
        print("Начали упражнение - Приседания")
    }
    
    func stop() {
        print("Закончили упражнение - Приседания")
    }
    
}

class Jumping: Exercise {
    var name: String = "Прыжки"
    
    var type: String = "Упражнения для ног"
    
    func start() {
        print("Начали упражнение - Прыжки")
    }
    
    func stop() {
        print("Закончили упражнение - Прыжки")
    }
    
}

//MARK: Exercises factory
class ExercisesFactory {
    static func createExercise(type: Exersices) -> Exercise {
        switch type {
        case .squarts:
            return Squarts()
        case .jumping:
            return Jumping()
        }
    }
}
