//
//  SetOfFurniture.swift
//  Pattern
//
//  Created by Олег on 13.09.2021.
//  Copyright © 2021 Oleg Ben. All rights reserved.
//

import Foundation

// MARK: SetOfFurniture
/// Протокол комплекта мебели
protocol SetOfFurniture {
    /// Стоимость комплекта
    var cost: Double { get }
    /// Описание комплекта
    func getSetDescription() -> String
}

// MARK: StartingSetOfFortune
/// Начальный комплект мебели
class StartingSetOfFurniture: SetOfFurniture {
    /// Стоимость начального комплекта
    var cost: Double {
        get {
            return 0.0
        }
    }
    
    /// Описание начального комплекта мебели
    func getSetDescription() -> String {
        return "Ваш комплект мебели:"
    }
}

// MARK: SetOfFurnitureAdapter
/// Адаптер, для создания расширяемого комплекта мебели
class SetOfFurnitureAdapter: SetOfFurniture {
    /// Текущий комплект мебели
    private var setOfFurniture: SetOfFurniture
    
    /// Инициализатор
    /// - Parameter setOfFurniture: SetOfFurniture
    init(_ setOfFurniture: SetOfFurniture) {
        self.setOfFurniture = setOfFurniture
    }
    
    /// Стоимость текущего комплекта мебели
    var cost: Double {
        get {
            return self.setOfFurniture.cost
        }
    }
    
    /// Описание текущего комплекта мебели
    func getSetDescription() -> String {
        return self.setOfFurniture.getSetDescription()
    }
}

// MARK: SetOfFurnitureWithTwoChairs
/// Комплект мебели с набором двух стульев
class SetOfFurnitureWithTwoChairs: SetOfFurnitureAdapter {
    /// Стоимость копмлекта с двумя стульями
    override var cost: Double {
        get {
            return super.cost + 2000.0
        }
    }
    
    /// Описание комплекта с двумя стульями
    override func getSetDescription() -> String {
        return super.getSetDescription() + "\n- Два стула"
    }
}

// MARK: SetOfFurnitureWithFourChairs
/// Комплект мебели с набором четырех стульев
class SetOfFurnitureWithFourChairs: SetOfFurnitureAdapter {
    /// Стоимость комплекта с четырьмя стульями
    override var cost: Double {
        get {
            return super.cost + 3950.0
        }
    }
    
    /// Описание комплекта с четырьмя стульями
    override func getSetDescription() -> String {
        return super.getSetDescription() + "\n- Четыре стула"
    }
}

// MARK: SetOfFurnitureWithTable
/// Комплект мебели со столом
class SetOfFurnitureWithTable: SetOfFurnitureAdapter {
    /// Стоимость комплекта со столом
    override var cost: Double {
        get {
            return super.cost + 5000.0
        }
    }
    
    /// Описание комплекта со столом
    override func getSetDescription() -> String {
        return super.getSetDescription() + "\n- Стол"
    }
}
