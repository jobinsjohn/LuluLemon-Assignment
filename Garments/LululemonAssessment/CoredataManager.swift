//
//  CoredataManager.swift
//  LululemonAssessment
//
//  Created by Jobins John on 2022-08-24.
//

import Foundation
import CoreData

final class CoredataManager {
    
    private init() {  }
    
    static let shared = CoredataManager()
    
    lazy var context = self.persistentContainer.viewContext
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "LululemonAssessment")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Fetching support
    
    func fetch<T: NSManagedObject>(_ objectType: T.Type) -> [T]? {
        let object = String(describing: objectType)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: object)
        do {
            let contacts = try context.fetch(fetchRequest) as? [T]
            return contacts
        } catch let error {
            print(error)
            return [T]()
        }
    }
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
