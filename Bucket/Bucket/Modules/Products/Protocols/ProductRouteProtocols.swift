//
//  HomeScreenProtocols.swift
//  TravelTracker
//
//  Created by Abhisek on 08/01/18.
//  Copyright © 2018 Abhisek. All rights reserved.
//

import Foundation
import UIKit

protocol ProductViewProtocol {
    
    var viewRef: ProductViewController? {get set}
    var wireframe: ProductRouteWireframe? {get set}
    var interactor: ProductInteractor? {get set}
    //View -> Presenter
    func viewDidLoad()
    func hasAddedToWishList(item: Product) -> Bool
    func updateWishList(item: Product)
}

protocol ProductPresenterProtocol {
  //Presenter -> View
    func updateProductList(items: [Product]?, error: Error?)
    func didUpdateWishList()
}

protocol ProductInteractorInputProtocol {
    var presenter: ProductPresenter? {get set}
    //Presenter -> Interactor
    func fetachStoredProducts()
    func fetachWishList() -> [WishListItem]? 
    func getProducts()
}

protocol ProductInteractorOutputProtocol {
    //Interactor -> Protocol
    func didFinishRetrieve(items: [Product]?, error: Error?)
    func didFinishFetch(items: [Product]?, error: Error?)
    func didWishListUpdate()
}

protocol ProductWireframeProtocol {
  //Presenter -> Wireframe
}
