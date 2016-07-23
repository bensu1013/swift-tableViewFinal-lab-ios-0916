# TableView Final

![Albert](http://i.imgur.com/ppc5nAG.jpg?1)  

> If you want to live a happy life, tie it to a goal, not to people or things. ~[Albert Einstein](https://en.wikipedia.org/wiki/Albert_Einstein)

## Learning Objectives

* Complete this lab

## Directions

In this lab, you will create a complete iOS app from scratch. As you've probably guessed, this app will be backed by a table view. Tapping on a cell in the main table view will slide in a view that gives more details about the cell you tapped. The main view will show a list of planets, and tapping a cell will show some facts about that planet.

When you're done, the main view will look like this:

![Table view](https://s3.amazonaws.com/learn-verified/planet-tableview.png)

Tapping on a cell will bring up this view:

![Detail view](https://s3.amazonaws.com/learn-verified/planet-detailview.png)

A basic Xcode project has already been configured for you, but it is up to you to lay out the views and write the code that will power this app. Open up `TableViewFinal.xcworkspace`, included in this repository, to get started.

This lab has a lot of parts to it, so let's break it down piece-by-piece.

### `Planet` class

The data for this app will be stored in instances of a simple class called `Planet`, which is implemented in `Planet.swift`. This class has no behavior other than storing the attributes of a planet. It will be used by the table view controller to store data about planets. Completing this class is easy:

1. Add four properties to the `Planet` class: `name`, `numberOfMoons`, `fullOrbit`, and `facts`. `name` should obviously be a `String`, and `numberOfMoons` should be an `Int`.

    `fullOrbit` is the length of the planet's orbits in _days_. Can you guess what data type this should be? A planet's orbit can be a fraction of an Earth day, so this should be a `Double`.
    
    Each fact is a `String`, and a planet can have a number of facts, so this should be an `Array` of `String`s (`[String]`).
    
2. Implement an initializer (an `init` method) that accepts these four properties as parameters and sets the properties to the relevant parameter.

That's it! The `Planet` class is done. On to the next class.

### `FactTableViewController`

Next we'll finish the implementation of `FactTableViewController`, the table view controller that manages the detailed planet view. Open up `FactTableViewController.swift` in Xcode's code editor to get started on this class.

1. First, add a constant `String` called `factCellIdentifier`. This is the reuse identifier for the cells managed by this table view controller, so it will be used to dequeue a reusable cell for this table. Assign to this variable the string "FactCell".
2. Create a property `planet` of type `Planet!`. This will store the planet whose facts are displayed in this table.
3. Override `viewDidLoad()` to change the `title` of the table view to the name of the planet stored in the `planet` property. This title will be displayed in the nav bar. Don't forget to call `super.viewDidLoad()`, too!
4. Override `numberOfSectionsInTableView(_:)` to return the number of sections in this table view (just one).
5. Override `tableView(_:numberOfRowsInSection:)` to return the number of rows in the table. This is equal to the number of facts you have for the planet being displayed in this view. Remember, the planet is stored in the `planet` property, and `Planet`s have a `facts` array that stores all their facts.

We'll save the implementation of the final table view controller method, `tableView(_:cellForRowAtIndexPath:)` for later, after we've completed the implementation of `FactTableViewCell`, which requires some work in Interface Builder.

### `PlanetTableViewController`

Let's implement the code for `PlanetTableViewController` next. This is the class that will power the main table view.

Open up `PlanetTableViewController.swift` in Xcode's code editor. Right now, this class is completely empty, but adding code to make it work is pretty easy.

Here's what you need to do to complete this class:

1. Add a property called `planetCellIdentifier`. This is a `String` which will identify the type of cell you want to dequeue from the table view. Assign this the string "PlanetCell".
2. You will also need to create a property called `planets` to store the facts for a list of planets. You already have a `Planet` class that will store the data, and a table view will show multiple planets, so what should the type of this property be? (If you guessed `[Planet]`, you're right!)
3. Next, you should create a method called `generatePlanetInfo()` that will fill in the `planets` property you just created. This method takes no parameters and returns no value (it sets the `planets` property directly). To keep this simple, you only need to generate facts for two planets, Earth and Mars. Here are the planets and their relevant facts:
	* **Earth**
		* **Number of Moons:** 1
		* **Full Orbit:** 365.26
		* **Facts**:
			1. Earth is the only planet not named after a god.
			2. Earth has a powerful magnetic field.
			3. Earth was once believed to be the center of the universe.
	* **Mars**
		* **Number of Moons:** 2
		* **Full Orbit:** 687.0
		* **Facts:**
			1. Mars and Earth have approximately the same landmass.
			2. Mars is home to the tallest mountain in the solar system.
			3. Pieces of Mars have fallen to Earth.
4. You will need to call `generatePlanetInfo()` to fill in the `planets` property. You can call this from an overriden `viewDidLoad()` method. Don't forget to call `super.viewDidLoad() first!
5. Implement `numberOfSectionsInTableView(_:)`. There is only one section in this table view.
6. Implement `tableView(_:numberOfRowsInSection:)`. The number of rows is equal to the number of planets tracked by this class.
7. Implement `prepareForSegue(_:sender:)`. This method first needs to get the destination view controller using `segue.destinationViewController` and cast it to a view controller of type `FactTableViewController`. It then needs to get the index path for the selected row, and grab the correct planet from the `planets` property. Finally, it should set the `planet` property of the destination view controller to the selected planet. (If you need help, take a look at the previous labs and lessons for hints on how to implement this method properly.)

For now, we'll skip the implementations of the remaining table view source method, `tableView(_:cellForRowAtIndexPath:)`, since that requires `PlanetTableViewCell` to be implemented, which, in turn, requires some work in Interface Builder. We'll come back to this method later.

### Interface Builder

Now we'll tackle the design of the interface in Interface Builder.

#### Main View

The first scene you need to lay out is the scene for the main view.

1. Drag a new table view controller from the object library to the storyboard. Make sure you set this view controller to be the initial view controller. Change its class to `PlanetTableViewController`.
2. Embed a navigation controller in this scene.
3. Set the title of this view controller (its **Navigation Item**) to "Planets".
4. Set the reuse identifier of this table's cells to "PlanetCell".

##### Table Cells

Next we're going to work on the main view's table cells. These cells are more complicated that ones you've designed before, but we'll walk through it step by step.

1. First, _make sure you have selected the prototype cell!_
2. Change the cell's class to `PlanetTableViewCell`.
2. Set the prototype cell's height to 148 using the Size inspector.
3. Drag three labels onto the prototype cell. These correspond to the planet name, number of moons, and orbital length. (Refer to the screenshot at the beginning of this README if you forget what the cells are supposed to look like.)
4. Using the Attributes Inspector, change the first label's font to Avenir Next Regular 36, and its text color to brown. Change the height of the label to 35 using the Size Inspector.
5. Change the second and third labels' fonts to Body using the Attributes Inspector.
6. Add all three of these labels to a stacked view. Select all three labels, then press the **Stack** button at the bottom of Interface Builder. In the Attributes Inspector, make sure **Alignment** is set to **Leading** and **Distribution** is set to **Fill Equally**.
7. You will have to add some constraints to the stack view. Click the **Constraints** button and add constraints to the top, bottom, and left side by clicking the red lines, as shown below:
   ![Constraints](https://s3.amazonaws.com/learn-verified/planets-stack-constraints.png)
8. Add another label to the cell. Drop it so it is aligned along the right-hand side and centered vertically. Change the font to Avenir Next Regular 24 and the text color to orange using the Attributes Inspector. Change its height to 35 using the Size inspector.
9. Open up `PlanetTableViewCell.swift` in an assistant editor. Create an IB outlet for each label you added to the cell. The names of these outlets should be `planetNameLabel`, `numberOfMoonsLabel`, `numberOfDaysFullOrbitLabel`, and `numberOfFacts` label.

#### Detail View

Next, we'll work on the detail view. This is the view that appears when you tap on a cell. It shows all the facts for the tapped planet.

1. Drag a new table view controller onto the storyboard.
2. Change the new table view controller's class to `FactTableViewController`.
3. Set the reuse identifier of this table's cells to "FactCell".

##### Table Cells

The cells for the detail table view are a lot easier to lay out. First, make sure you have this table view controller's prototype cell selected. Then:

1. Change the class of the prototype cell to `FactTableViewCell`.
2. Change the height of the cell to 155 using the Size Inspector.
3. Drag a new _text view_ onto the prototype cell. Drag its resize handles so it fills the entire cell. Change the font to Avenir Next Regular 30. Set the text color to a maroon color. Set its alignment to left.
4. Click the **Constraints** button at the bottom of the Interface Builder window. Click all four red arrows and then click **Add 4 Constraints**.
5. Add an IB outlet for the label you just created. Open up `FactTableViewCell.swift` in an assistant editor pane, then <kbd>Control</kbd>-drag an outlet from the text view to `FactTableViewCell`. Name this outlet `factTextView`.
6. Finally, create a segue from the cells in the main table view to this detail view.

### Finishing Up

Time to put the finishing touches on this app and ship it.

1. Open up `PlanetTableViewController.swift` in Xcode's code editor. You need to override `tableView(_:cellForRowAtIndexPath:)`. This method should dequeue a reusable cell using the reuse identifier specified in the table view controller's `planetCellIdentifier` property, then initialize its labels and return the cell.
2. You also need to implement the same method in `FactTableViewController`. Open up `FactTableViewController.swift` in Xcode's code editor. You need to override `tableView(_:cellForRowAtIndexPath:)`. Again, this should dequeue a reusable cell identified by the `factCellIdentifier` property, initialize its `factTextView` text view with the appropriate fact, and return the cell.

That's it! If you've followed all these directions, you'll now have an app that works as described and shows the views in the screenshots above.

<a href='https://learn.co/lessons/TableViewFinalLab' data-visibility='hidden'>View this lesson on Learn.co</a>
