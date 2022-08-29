//
//  LululemonAssessmentTests.swift
//  LululemonAssessmentTests
//
//  Created by Jobins John on 2022-08-24.
//
import XCTest
@testable import LululemonAssessment
import CoreData

class LululemonAssessmentTests: XCTestCase {
    
    func test_init_coreDataManager(){
        let instance = CoredataManager.shared
        XCTAssertNotNil(instance)
    }
    
    func test_coreDataStackInitialization() {
        let coreDataStack = CoredataManager.shared.persistentContainer
        XCTAssertNotNil(coreDataStack)
    }
    
    func test_insert_garment() {
        let context = CoredataManager.shared.context
        guard let entity = NSEntityDescription.entity(forEntityName: "Garments", in: context) else { return }
        
        let garmentModel = NSManagedObject(entity: entity, insertInto: context) as? Garments
        garmentModel?.garmentName = "Jeans"
        garmentModel?.createdTime = Date()
        try XCTAssertNotNil(context.save())
    }
    
    func test_fetch_all_garments() {
        guard let garmentsCount = CoredataManager.shared.fetch(Garments.self)?.count else { return }
        test_insert_garment()
        if let garmentArray = CoredataManager.shared.fetch(Garments.self) {
            XCTAssertEqual(garmentArray.count, garmentsCount + 1)
        }
    }
}
