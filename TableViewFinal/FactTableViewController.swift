//
//  FactTableViewController.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class FactTableViewController: UITableViewController {
    
    var planet: Planet!
    let factCellIdentifier = "factCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = planet.name.capitalizedString
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planet.facts.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(factCellIdentifier, forIndexPath: indexPath) as! FactTableVIewCell
        
        let currentFact = planet.facts[indexPath.row]
        
        cell.factTextView.text = currentFact
        
        return cell
    }
 

}
