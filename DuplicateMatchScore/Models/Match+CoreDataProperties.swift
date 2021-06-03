//
//  Match+CoreDataProperties.swift
//  DuplicateMatchScore
//
//  Created by Sandra K Cureton on 6/3/21.
//
//

import Foundation
import CoreData


extension Match {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Match> {
        return NSFetchRequest<Match>(entityName: "Match")
    }

    @NSManaged public var boardsperround: Int16
    @NSManaged public var club: String?
    @NSManaged public var date: Date?
    @NSManaged public var matchkey: UUID?
    @NSManaged public var names: String?
    @NSManaged public var pairs: Bool
    @NSManaged public var players: Int16
    @NSManaged public var rounds: Int16

}

extension Match : Identifiable {

}
