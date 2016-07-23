//
//  Planet.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Planet {
    let name: String
    let numberOfMoons: Int
    let fullOrbit: Double
    let facts: [String]

    init(name: String, numberOfMoons: Int, fullOrbit: Double, facts: [String]) {
        self.name = name
        self.numberOfMoons = numberOfMoons
        self.fullOrbit = fullOrbit
        self.facts = facts
    }
}
