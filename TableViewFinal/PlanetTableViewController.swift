//
//  PlanetTableViewController.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class PlanetTableViewController: UITableViewController {
    
    var planets: [Planet] = []
    let planetCellIdentifier = "planetCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generatePlanetInfo()
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(planetCellIdentifier, forIndexPath: indexPath) as! PlanetTableViewCell
        
        let planet = planets[indexPath.row]
        
        cell.planetNameLabel.text = planet.name
        cell.numberOfDaysFullOrbitLabel.text = "\(planet.fullOrbit) days (full orbit)"
        cell.numberOfFactsLabel.text = "\(planet.facts.count) facts"
        
        switch planet.numberOfMoons {
        case 0:
            cell.numberOfMoonsLabel.text = "No Moons"
        case 1:
            cell.numberOfMoonsLabel.text = "1 Moon"
        default:
            cell.numberOfMoonsLabel.text = "\(planet.numberOfMoons) Moons"
        }
        
        return cell
    }
    
    
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destVC = segue.destinationViewController as! FactTableViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            
            let chosenPlanet = planets[indexPath.row]
            destVC.planet = chosenPlanet
        }
        
        
        
        
    }
    
    
    
    func generatePlanetInfo() {
        
        let earthFacts = [
            "Earth is the only planet not named after a god.",
            "Earth has a powerful magnetic field.",
            "The Earth was once believed to be the center of the universe."
        ]
        let earth = Planet(name: "Earth", numberOfMoons: 1, fullOrbit: 365.26, facts: earthFacts)
        planets.append(earth)
        
        let marsFacts = [
        "Mars and Earth have approximately the same landmass.",
        "Mars is home to the tallest mountain in the solar system.",
        "Pieces of Mars have fallen to Earth."
        ]
        
        let mars = Planet(name: "Mars", numberOfMoons: 2, fullOrbit: 687, facts: marsFacts)
        planets.append(mars)

        
        
        
    }
    
    
}
