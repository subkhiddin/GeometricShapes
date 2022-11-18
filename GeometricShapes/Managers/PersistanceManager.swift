//
//  PersistanceManager.swift
//  GeometricShapes
//
//  Created by Nuriddinov Subkhiddin on 15/11/22.
//

import UIKit
import CoreData


class DataPersistanceManager {
    
    enum DatabaseError: Error {
        case failedToSaveData
        case failedToFetchData
        case failedToDeleteData
    }
    
    static let shared = DataPersistanceManager()
    
    func downloadFavoriteWith(model: Shapes, completion: @escaping (Result<Void, Error>) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let item = Favorite(context: context)
        
        item.name = model.name
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            print(DatabaseError.failedToSaveData)
        }
    }
    
    
    func fetchingFavoriteFromDataBase(complesion: @escaping (Result<[Favorite], Error>) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request: NSFetchRequest<Favorite>
        
        request = Favorite.fetchRequest()
        
        do {
            let titles = try context.fetch(request)
            complesion(.success(titles))
        } catch {
            complesion(.failure(DatabaseError.failedToSaveData))
        }
    }
    
    
    func deleteFavoriteWidth(model: Favorite, complition: @escaping (Result<Void, Error>) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        
        context.delete(model)
        
        do {
            try context.save()
            complition(.success(()))
        } catch {
            complition(.failure(DatabaseError.failedToDeleteData))
        }
    }
    
}
