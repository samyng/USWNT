//
//  ScheduleTableViewController.swift
//  USWNT
//
//  Created by Sam Yang on 2/7/16.
//  Copyright © 2016 Sam Yang. All rights reserved.
//

import UIKit
import CoreData

let UPCOMING_GAMES_SECTION_INDEX = 0
let RESULT_GAMES_SECTION_INDEX = 1

class ScheduleTableViewController: UITableViewController {
    var scheduleGames = []
    var resultGames = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadGames()
        self.tableView.contentInset = UIEdgeInsetsMake(0.0, 0.0, 50.0, 0.0)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == UPCOMING_GAMES_SECTION_INDEX) {
            return scheduleGames.count
        } else if (section == RESULT_GAMES_SECTION_INDEX) {
            return resultGames.count
        } else {
            return 0
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("kGameTableCellIdentifier", forIndexPath: indexPath) as! GameTableViewCell
        if (indexPath.section == UPCOMING_GAMES_SECTION_INDEX) {
            let game = scheduleGames.objectAtIndex(indexPath.row) as! Game
            cell.matchupLabel.text = game.matchup ?? ""
            cell.gameDateLabel.text = game.gameDate! ?? "" + "; " + game.gameTime! ?? ""
            cell.venueLabel.text = game.venue ?? ""
            cell.resultsLabel.text = ""
        } else if (indexPath.section == RESULT_GAMES_SECTION_INDEX) {
            let game = resultGames.objectAtIndex(indexPath.row) as! Game
            cell.matchupLabel.text = game.matchup ?? ""
            cell.gameDateLabel.text = game.gameDate! ?? "" + "; " + game.gameTime! ?? ""
            cell.venueLabel.text = game.venue! ?? "" + " (" + (game.attendance?.stringValue)! ?? "" + " attended)"
            cell.resultsLabel.text = game.result! ?? "" + "; Goal scorers: " + game.goalScorers! ?? ""
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == UPCOMING_GAMES_SECTION_INDEX) {
            return "Upcoming Games"
        } else if (section == RESULT_GAMES_SECTION_INDEX) {
            return "Results"
        } else {
            return ""
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func loadGames() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName:GAME_ENTITY_NAME)
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            var upcomingGames:[Game] = []
            var pastGames:[Game] = []
            for result in results {
               let game = result as! Game
                if game.upcoming == 1 {
                    upcomingGames.append(game)
                } else {
                    pastGames.append(game)
                }
            }
            scheduleGames = upcomingGames
            resultGames = pastGames
            
            let gameSortDescriptor:NSSortDescriptor = NSSortDescriptor(key:GAME_INDEX_ATTRIBUTE_NAME, ascending: true)
            scheduleGames = (scheduleGames as NSArray).sortedArrayUsingDescriptors([gameSortDescriptor])
            resultGames = (resultGames as NSArray).sortedArrayUsingDescriptors([gameSortDescriptor])
            
            if (scheduleGames.count == 0) {
                self.createGames()
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    func createGames() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let gameEntityDescription =  NSEntityDescription.entityForName(GAME_ENTITY_NAME,
            inManagedObjectContext:managedContext)
        
        let match2016_1 = NSManagedObject(entity: gameEntityDescription!,
            insertIntoManagedObjectContext: managedContext)
        match2016_1.setValue(NSNumber(integer: 23309), forKey: ATTENDANCE_ATTRIBUTE_NAME)
        match2016_1.setValue("January 23, 2016", forKey: GAME_DATE_ATTRIBUTE_NAME)
        match2016_1.setValue("Lloyd [3], Morgan, Pugh", forKey: GOAL_SCORERS_ATTRIBUTE_NAME)
        match2016_1.setValue("WNT vs Ireland", forKey: MATCHUP_ATTRIBUTE_NAME)
        match2016_1.setValue("5-0 W", forKey: RESULT_ATTRIBUTE_NAME)
        match2016_1.setValue(NSNumber(integer: 0), forKey: UPCOMING_ATTRIBUTE_NAME)
        match2016_1.setValue("2 PM PT", forKey: GAME_TIME_ATTRIBUTE_NAME)
        match2016_1.setValue("Qualcomm Stadium; San Diego, Calif.", forKey: VENUE_ATTRIBUTE_NAME)
        match2016_1.setValue(NSNumber(integer: 1), forKey: GAME_INDEX_ATTRIBUTE_NAME)
        
        let match2016_2 = NSManagedObject(entity: gameEntityDescription!,
            insertIntoManagedObjectContext: managedContext)
        match2016_2.setValue("February 10, 2016", forKey: GAME_DATE_ATTRIBUTE_NAME)
        match2016_2.setValue("WNT vs Costa Rica", forKey: MATCHUP_ATTRIBUTE_NAME)
        match2016_2.setValue("7:30 PM CT", forKey: GAME_TIME_ATTRIBUTE_NAME)
        match2016_2.setValue(NSNumber(integer: 1), forKey: UPCOMING_ATTRIBUTE_NAME)
        match2016_2.setValue("Toyota Stadium; Frisco, Texas", forKey: VENUE_ATTRIBUTE_NAME)
        match2016_1.setValue(NSNumber(integer: 2), forKey: GAME_INDEX_ATTRIBUTE_NAME)
        
        let match2016_3 = NSManagedObject(entity: gameEntityDescription!,
            insertIntoManagedObjectContext: managedContext)
        match2016_3.setValue("February 13, 2016", forKey: GAME_DATE_ATTRIBUTE_NAME)
        match2016_3.setValue("WNT vs Mexico", forKey: MATCHUP_ATTRIBUTE_NAME)
        match2016_3.setValue("3 PM CT", forKey: GAME_TIME_ATTRIBUTE_NAME)
        match2016_3.setValue(NSNumber(integer: 1), forKey: UPCOMING_ATTRIBUTE_NAME)
        match2016_3.setValue("Toyota Stadium; Frisco, Texas", forKey: VENUE_ATTRIBUTE_NAME)
        match2016_1.setValue(NSNumber(integer: 3), forKey: GAME_INDEX_ATTRIBUTE_NAME)
        
        let match2016_4 = NSManagedObject(entity: gameEntityDescription!,
            insertIntoManagedObjectContext: managedContext)
        match2016_4.setValue("February 15, 2016", forKey: GAME_DATE_ATTRIBUTE_NAME)
        match2016_4.setValue("WNT vs Puerto Rico", forKey: MATCHUP_ATTRIBUTE_NAME)
        match2016_4.setValue("7:30 PM CT", forKey: GAME_TIME_ATTRIBUTE_NAME)
        match2016_4.setValue(NSNumber(integer: 1), forKey: UPCOMING_ATTRIBUTE_NAME)
        match2016_4.setValue("Toyota Stadium; Frisco, Texas", forKey: VENUE_ATTRIBUTE_NAME)
        match2016_1.setValue(NSNumber(integer: 4), forKey: GAME_INDEX_ATTRIBUTE_NAME)
        
        let match2016_5 = NSManagedObject(entity: gameEntityDescription!,
            insertIntoManagedObjectContext: managedContext)
        match2016_5.setValue("February 19, 2016", forKey: GAME_DATE_ATTRIBUTE_NAME)
        match2016_5.setValue("Women's Olympic Qualifying - Semifinals", forKey: MATCHUP_ATTRIBUTE_NAME)
        match2016_5.setValue("4:30 PM CT", forKey: GAME_TIME_ATTRIBUTE_NAME)
        match2016_5.setValue(NSNumber(integer: 1), forKey: UPCOMING_ATTRIBUTE_NAME)
        match2016_5.setValue("BBVA Compass Stadium; Houston, Texas", forKey: VENUE_ATTRIBUTE_NAME)
        match2016_1.setValue(NSNumber(integer: 5), forKey: GAME_INDEX_ATTRIBUTE_NAME)
        
        let match2016_6 = NSManagedObject(entity: gameEntityDescription!,
            insertIntoManagedObjectContext: managedContext)
        match2016_6.setValue("February 21, 2016", forKey: GAME_DATE_ATTRIBUTE_NAME)
        match2016_6.setValue("Women's Olympic Qualifying - Final", forKey: MATCHUP_ATTRIBUTE_NAME)
        match2016_6.setValue("4 PM CT", forKey: GAME_TIME_ATTRIBUTE_NAME)
        match2016_6.setValue(NSNumber(integer: 1), forKey: UPCOMING_ATTRIBUTE_NAME)
        match2016_6.setValue("BBVA Compass Stadium; Houston, Texas", forKey: VENUE_ATTRIBUTE_NAME)
        match2016_1.setValue(NSNumber(integer: 6), forKey: GAME_INDEX_ATTRIBUTE_NAME)
        
        let match2016_7 = NSManagedObject(entity: gameEntityDescription!,
            insertIntoManagedObjectContext: managedContext)
        match2016_7.setValue("March 3, 2016", forKey: GAME_DATE_ATTRIBUTE_NAME)
        match2016_7.setValue("WNT vs England", forKey: MATCHUP_ATTRIBUTE_NAME)
        match2016_7.setValue("7:30 PM ET", forKey: GAME_TIME_ATTRIBUTE_NAME)
        match2016_7.setValue(NSNumber(integer: 1), forKey: UPCOMING_ATTRIBUTE_NAME)
        match2016_7.setValue("Raymond James Stadium; Tampa Bay, Fla.", forKey: VENUE_ATTRIBUTE_NAME)
        match2016_1.setValue(NSNumber(integer: 7), forKey: GAME_INDEX_ATTRIBUTE_NAME)
        
        let match2016_8 = NSManagedObject(entity: gameEntityDescription!,
            insertIntoManagedObjectContext: managedContext)
        match2016_8.setValue("March 6, 2016", forKey: GAME_DATE_ATTRIBUTE_NAME)
        match2016_8.setValue("WNT vs France", forKey: MATCHUP_ATTRIBUTE_NAME)
        match2016_8.setValue("2 PM CT", forKey: GAME_TIME_ATTRIBUTE_NAME)
        match2016_8.setValue(NSNumber(integer: 1), forKey: UPCOMING_ATTRIBUTE_NAME)
        match2016_8.setValue("Nissam Stadium; Nashville, Tenn.", forKey: VENUE_ATTRIBUTE_NAME)
        match2016_1.setValue(NSNumber(integer: 8), forKey: GAME_INDEX_ATTRIBUTE_NAME)
        
        let match2016_9 = NSManagedObject(entity: gameEntityDescription!,
            insertIntoManagedObjectContext: managedContext)
        match2016_9.setValue("March 9, 2016", forKey: GAME_DATE_ATTRIBUTE_NAME)
        match2016_9.setValue("WNT vs Germany", forKey: MATCHUP_ATTRIBUTE_NAME)
        match2016_9.setValue("7:30 PM CT", forKey: GAME_TIME_ATTRIBUTE_NAME)
        match2016_9.setValue(NSNumber(integer: 1), forKey: UPCOMING_ATTRIBUTE_NAME)
        match2016_9.setValue("FAU Stadium; Boca Raton, Fla.", forKey: VENUE_ATTRIBUTE_NAME)
        match2016_1.setValue(NSNumber(integer: 9), forKey: GAME_INDEX_ATTRIBUTE_NAME)
        
        scheduleGames = [match2016_2, match2016_3, match2016_4, match2016_5, match2016_6, match2016_7, match2016_8, match2016_9]
        resultGames = [match2016_1]
        
        do {
            try managedContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }

}
