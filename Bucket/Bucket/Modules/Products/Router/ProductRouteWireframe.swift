//
//  SearchRouteWireframe.swift
//  TravelTracker
//
//  Created by Abhisek on 08/01/18.
//  Copyright © 2018 Abhisek. All rights reserved.
//

import UIKit

class ProductRouteWireframe {
  
//  func navigateToWatchlistPage(showRoute route: GoogleRoute, from classRef: UIViewController) {
//
//    let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
//    let mapsController = mainStoryBoard.instantiateViewController(withIdentifier: "MapController") as! MapController
//    mapsController.routeToDisplay = route
//    guard let sourceNavigationController = classRef.navigationController else {
//      classRef.present(mapsController, animated: true, completion: nil)
//      return
//    }
//    sourceNavigationController.pushViewController(mapsController, animated: true)
//
//  }
//
  class func loadSearchPageComponents(withPresenter presenter: ProductPresenter) {
    presenter.wireframe = ProductRouteWireframe()
    presenter.interactor = ProductInteractor()
    presenter.interactor?.presenter = presenter
  }
  
}

extension ProductRouteWireframe: ProductWireframeProtocol {
//  func showRouteInMap(from controller: SearchController, withRoute route: GoogleRoute) {
//    navigateToMapsPage(showRoute: route, from: controller)
//  }
}
