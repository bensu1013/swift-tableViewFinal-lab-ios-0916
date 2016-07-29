//
//  PlanetTableVCTests.swift
//  TableViewFinal
//
//  Created by James Campagno on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Quick
import Nimble
@testable import TableViewFinal

class PlanetTableVCSpec: QuickSpec {
    override func spec() {
        
        describe("PlanetTableViewController") {
            
            let testVC = PlanetTableViewController()
            
            describe("planetCellIdentifier property") {
                it("Should be set to the value 'PlanetCell' on declaration") {
                    
                    let expectedIdentifier = "PlanetCell"
                    
                    expect(testVC.planetCellIdentifier).to(equal(expectedIdentifier))
                    
                }
                
            }
            
            describe("generatePlanetInfo()") {
                it("Should create two planets, Earth & Mars.. initialized with the approrpiate values. It should then store these two values inside of the planets array property on the view controller") {
                    
                    let earthFacts = [
                        "Earth is the only planet not named after a god.",
                        "Earth has a powerful magnetic field.",
                        "Earth was once believed to be the center of the universe."
                    ]
                    
                    let marsFacts = [
                        "Mars and Earth have approximately the same landmass.",
                        "Mars is home to the tallest mountain in the solar system.",
                        "Pieces of Mars have fallen to Earth."
                    ]
                    
                    
                    testVC.generatePlanetInfo()
                    
                    expect(testVC.planets.count).to(equal(2))
                    
                    for planet in testVC.planets {
                        
                        switch planet.name {
                            
                        case "Earth":
                            expect(planet.name).to(equal("Earth"))
                            expect(planet.numberOfMoons).to(equal(1))
                            expect(planet.fullOrbit).to(equal(365.26))
                            expect(planet.facts).to(equal(earthFacts))
                            
                        case "Mars":
                            expect(planet.name).to(equal("Mars"))
                            expect(planet.numberOfMoons).to(equal(2))
                            expect(planet.fullOrbit).to(equal(687.0))
                            expect(planet.facts).to(equal(marsFacts))
                            
                            
                        default: print("Planet with a name other than Earth & Mars")
                            
                        }
                    }
                }
            }
        }
    }
}