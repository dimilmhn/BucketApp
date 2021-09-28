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
}

protocol ProductPresenterProtocol {
  //Presenter -> View
    func updateProductList(items: [ProductItem]?, error: Error?)
}

protocol ProductInteractorInputProtocol {
  var presenter: ProductPresenter? {get set}
  //Presenter -> Interactor
  func fetachStoredData()
  func getProductListData()
}

protocol ProductInteractorOutputProtocol {
  //Interactor -> Protocol
  func didFinishRetrieve(items: [ProductItem]?, error: Error?)
}

protocol ProductWireframeProtocol {
  //Presenter -> Wireframe
//  func showRouteInMap(from controller: SearchController, withRoute route: GoogleRoute)
}
