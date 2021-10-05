//
//  CarBuilder.swift
//  Pattern
//
//  Created by user on 05.10.2021.
//  Copyright © 2021 Oleg Ben. All rights reserved.
//

import Foundation

/// Тип корпуса
enum CarcasType: String {
    case metal = "металический корпус"
    case plastic = "облегченный корпус"
}

/// Протокол машины
protocol CarProtocol {
    var description: String { get }
}

/// Протокол для билдера
protocol Builder {
    func setEngine(with maxSpeed: Int) -> Builder
    func setSeats(count: Int) -> Builder
    func setCarcas(type: CarcasType) -> Builder
    func build() -> CarProtocol
}

/// Билдер машин
final class CarBuilder: Builder {
    private var maxSpeed: Int = 0
    private var seats: Int = 0
    private var carcas: CarcasType?
    
    func setEngine(with maxSpeed: Int) -> Builder {
        self.maxSpeed = maxSpeed
        return self
    }
    
    func setSeats(count: Int) -> Builder {
        self.seats = count
        return self
    }
    
    func setCarcas(type: CarcasType) -> Builder {
        self.carcas = type
        return self
    }
    
    func build() -> CarProtocol {
        if let carcas = self.carcas {
            return Car(maxSpeed: self.maxSpeed, seatsCount: self.seats, carcas: carcas)
        } else {
            return Car(maxSpeed: self.maxSpeed, seatsCount: self.seats)
        }
        
    }
}

final class Car: CarProtocol {
    var description: String = ""
    
    init(maxSpeed: Int, seatsCount: Int, carcas: CarcasType) {
        self.description = "Новая модель, с максимальной скоростью \(maxSpeed) км/ч, \(seatsCount) мест и \(carcas.rawValue)"
    }
    
    init(maxSpeed: Int, seatsCount: Int) {
        self.description = "Новая модель, с максимальной скоростью \(maxSpeed) км/ч, \(seatsCount) мест"
    }
}
