//
//  SearchRouteInteractor.swift
//  TravelTracker
//
//  Created by Abhisek on 08/01/18.
//  Copyright © 2018 Abhisek. All rights reserved.
//

import UIKit
import CoreData

class ProductInteractor: ProductInteractorInputProtocol {
    
    var presenter: ProductPresenter?
    private let sessionProvider = NetworkServiceProvider()

    //Get recent searches by user from local database
    func fetachStoredData() {
        
        //    let managedObjectContext = CDManager.sharedDatabaseManager.persistentContainer.viewContext
        //    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Route")
        //    do {
        //      let savedSearchRsults = try managedObjectContext.fetch(fetchRequest) as! [Route]
        //      presenter?.didFinishFetchingRecentSearchResults(allSearches: savedSearchRsults, error: nil)
        //    } catch let error as NSError {
        //      print("Could not fetch. \(error), \(error.userInfo)")
        //      presenter?.didFinishFetchingRecentSearchResults(allSearches: nil, error: error)
        //    }
        
    }
    
    func getProductListData() {
        retrieveProductList(completion: { [weak self] items in
            guard let productItems = items else {
                return
            }
            self?.presenter?.didFinishRetrieve(items: productItems, error: nil)
            //            self?.repository.saveToDB(carItems)
        }, failure: { [weak self] error in
            self?.presenter?.didFinishRetrieve(items: nil, error: error)
        })
    }
    
    private func retrieveProductList(completion: @escaping(_ list: [ProductItem]?) -> Void, failure: @escaping (_ error: Error?) -> Void) {
        sessionProvider.request(type: [ProductItem].self, service: ProductService()) { [weak self] response in
            switch response {
            case let .success(list):
                completion(list)
            case let .failure(error):
                failure(error)
            }
        }
    }
    
    
    
    //  //Save the searches from user to local database
    //  func saveSearch(from startLocation: String, to endLocation: String) {
    //
    //    let managedObjectContext = CDManager.sharedDatabaseManager.persistentContainer.viewContext
    //    let entity = NSEntityDescription.insertNewObject(forEntityName: "Route", into: managedObjectContext) as! Route
    //    entity.startLocation = startLocation
    //    entity.endLocation = endLocation
    //    entity.dateSearched = Date() as NSDate
    //    CDManager.sharedDatabaseManager.saveContext()
    //
    //  }
}
