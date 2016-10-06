//
//  PlanetTableViewController.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class PlanetTableViewController: UITableViewController {
    var planetCellIdentifier: String = "PlanetCell"
    var planets: [Planet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generatePlanetInfo()
    }
    
    
    
    func generatePlanetInfo() {
        let earth = Planet(name: "Earth", numberOfMoons: 1, fullOrbit: 365.26, facts: [
            "Earth is the only planet not named after a god.",
            "Earth has a powerful magnetic field.",
            "Earth was once believed to be the center of the universe."
            ])
        let mars = Planet(name: "Mars", numberOfMoons: 2, fullOrbit: 687.0, facts: ["Mars and Earth have approximately the same landmass.","Mars is home to the tallest mountain in the solar system.","Pieces of Mars have fallen to Earth."])
        
        planets.append(earth)
        planets.append(mars)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: planetCellIdentifier, for: indexPath) as? PlanetTableViewCell
        let planet = planets[indexPath.row]
        cell?.factsLabel.text = "\(planet.facts.count) facts"
        cell?.moonLabel.text = "\(planet.numberOfMoons) Moon"
        cell?.orbitLabel.text = "\(planet.fullOrbit) days (full orbit)"
        cell?.planetLabel.text = planet.name
        
        return cell!
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segue.identifier
        if let dest = segue.destination as? FactTableViewController,
            let index = tableView.indexPathForSelectedRow {
            dest.planet = planets[index.row]
        }
        
        
        
    }
    
    
    
    
}
