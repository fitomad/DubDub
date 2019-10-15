//
//  DataManager.swift
//  DubDubKit
//
//  Created by Adolfo Vera Blasco on 13/10/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//

import CoreData
import Foundation

public class DataManager
{
    /// Nombre del modelo
    private let modelName: String
    /// Nombre del archivo de base de datos
    private let databaseName: String

    /// Singleton
    public static let shared = DataManager()

    /// Contenedor. En este caso es el nuevo 
    /// preparado para trabajar con `CloudKit`
    internal var storeContainer: NSPersistentCloudKitContainer!
    
    /// Contexto del contenedor de datos
    public var managedObjectContext: NSManagedObjectContext
    {
        return self.storeContainer.viewContext
    }
    
    private var applicationDataPath: URL
    {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return urls.first!.appendingPathComponent(self.databaseName)
    }
    
    /**
     
    */
    private init()
    {
        self.modelName = "DubDubDatabase"
        self.databaseName = "DubDub.sqlite"

        self.initiliazeStack()
    }
    
    //
    // MARK: - Core Data Stack -
    //
    
    /**
     
    */
    private func initiliazeStack() -> Void
    {
        let persistentDescription = NSPersistentStoreDescription(url: self.applicationDataPath)
        
        persistentDescription.type = NSSQLiteStoreType
        persistentDescription.shouldInferMappingModelAutomatically = true
        persistentDescription.shouldMigrateStoreAutomatically = true

        if #available(iOS 13, macOS 10.15, *)
        {
            // Configuración para CloudKit
            persistentDescription.cloudKitContainerOptions = NSPersistentCloudKitContainerOptions(containerIdentifier: "iCloud.com.desappstre.DubDub")
        }
        
        let container = NSPersistentCloudKitContainer(name: self.modelName)
        container.persistentStoreDescriptions = [ persistentDescription ]

        container.loadPersistentStores(completionHandler: {  (storeDescription: NSPersistentStoreDescription, error: Error?) -> Void in
            if let error = error
            {
                let message = "Problema al cargar los stores de Core Data.\n\(error.localizedDescription), \(String(describing: error._userInfo))"
                fatalError(message)
            }
        })

        self.storeContainer = container
    }
    
    /**
     
    */
    internal func saveContext() -> Void
    {
        guard self.storeContainer.viewContext.hasChanges else
        {
            return
        }
        
        do
        {
            // Guardamos en Core Data...
            try self.storeContainer.viewContext.save()
        }
        catch
        {
            print("err @ CORE DATA CONTEXT saveContext()")
        }
    }
}
