//
//  Garments+CoreDataProperties.swift
//  LululemonAssessment
//
//  Created by Usman on 17/02/21.
//  Copyright © 2021 Usman. All rights reserved.
//
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
