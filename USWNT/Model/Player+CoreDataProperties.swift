//
//  Player+CoreDataProperties.swift
//  USWNT
//
//  Created by Sam Yang on 2/6/16.
//  Copyright © 2016 Sam Yang. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Player {

    @NSManaged var firstName: String?
    @NSManaged var lastName: String?
    @NSManaged var nickName: String?
    @NSManaged var position: String?
    @NSManaged var clubName: String?
    @NSManaged var dateOfBirth: String?
    @NSManaged var height: String?
    @NSManaged var hometown: String?
    @NSManaged var headshotImageName: String?

}
