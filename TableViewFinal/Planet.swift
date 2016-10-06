//
//  Planet.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Planet {
    
    var name: String
    var numberOfMoons: Int
    var fullOrbit: Float
    var facts : [String]
    
    init(name: String, numberOfMoons: Int, fullOrbit: Float, facts: [String]) {
        self.name = name
        self.numberOfMoons = numberOfMoons
        self.fullOrbit = fullOrbit
        self.facts = facts
    }
    
}
