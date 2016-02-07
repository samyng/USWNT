//
//  Game+CoreDataProperties.swift
//  USWNT
//
//  Created by Sam Yang on 2/7/16.
//  Copyright © 2016 Sam Yang. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Game {

    @NSManaged var gameDate: String?
    @NSManaged var matchup: String?
    @NSManaged var result: String?
    @NSManaged var venue: String?
    @NSManaged var attendance: NSNumber?
    @NSManaged var goalScorers: String?
    @NSManaged var gameTime: String?
    @NSManaged var upcoming: NSNumber?
    @NSManaged var gameIndex: NSNumber?

}
