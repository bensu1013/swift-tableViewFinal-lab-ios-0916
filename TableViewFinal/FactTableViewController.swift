//
//  FactTableViewController.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class FactTableViewController: UITableViewController {
    let factCellIdentifier = "FactCell"
    var planet: Planet!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = planet.name
    }
}

extension FactTableViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planet.facts.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(factCellIdentifier, forIndexPath: indexPath) as! FactTableViewCell
        let fact = planet.facts[indexPath.row]
        cell.factTextView.text = fact
        return cell
    }
}
