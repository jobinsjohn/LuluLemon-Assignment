//
//  Garments+CoreDataProperties.swift
//  LululemonAssessment
//
//
//  Created by Jobins John on 2022-08-24.
//

import Foundation
import CoreData


extension Garments {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Garments> {
        return NSFetchRequest<Garments>(entityName: "Garments")
    }

    @NSManaged public var garmentName: String?
    @NSManaged public var createdTime: Date?

}
