//
//  BuilderViewController.swift
//  Pattern
//
//  Created by user on 05.10.2021.
//  Copyright © 2021 Oleg Ben. All rights reserved.
//

import UIKit

class BuilderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let car = CarBuilder().setCarcas(type: .metal)
            .setEngine(with: 250)
            .setSeats(count: 4)
            .build()
        print(car.description)
        
        let lightweightCar = CarBuilder().setCarcas(type: .plastic)
            .setEngine(with: 290)
            .setSeats(count: 2)
            .build()
        print(lightweightCar.description)
    }

}
