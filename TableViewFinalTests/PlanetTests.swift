//
//  PlanetTests.swift
//  TableViewFinal
//
//  Created by James Campagno on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Quick
import Nimble
@testable import TableViewFinal

class PlanetSpec: QuickSpec {
    override func spec() {
        
        describe("Planet") {
            let facts = [
                "The name comes from the latin word for love",
                "You get no iPhone reception from this planet"
            ]
            let amare = Planet(name: "Amare", numberOfMoons: 1, fullOrbit: 300.5, facts: facts)
            
            describe("Designated Initializer") {
                it("Should set the various properties to the values passed in through the initializer") {
                    expect(amare.name).to(equal("Amare"))
                    expect(amare.numberOfMoons).to(equal(1))
                    expect(amare.fullOrbit).to(equal(300.5))
                    expect(amare.facts).to(equal(facts))
                }
            }
        }
    }
}

