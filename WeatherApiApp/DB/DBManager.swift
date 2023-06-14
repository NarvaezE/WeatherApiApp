//
//  DBManager.swift
//  WeatherApiApp
//
//  Created by Edgar Narvaez on 13/06/23.
//

import Foundation
import CoreData

class DBManager {
    static let shared = DBManager()

    private init() {}

    lazy var dbManager: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "WeatherApiApp")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Fallo al cargar : \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    var managedObjectContext: NSManagedObjectContext {
        return dbManager.viewContext
    }
}
