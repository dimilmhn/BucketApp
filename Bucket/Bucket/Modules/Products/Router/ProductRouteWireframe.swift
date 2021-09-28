//
//  SearchRouteWireframe.swift
//  TravelTracker
//
//  Created by Abhisek on 08/01/18.
//  Copyright © 2018 Abhisek. All rights reserved.
//

import UIKit

class ProductRouteWireframe {
  class func loadProductComponents(withPresenter presenter: ProductPresenter) {
    presenter.wireframe = ProductRouteWireframe()
    presenter.interactor = ProductInteractor()
    presenter.interactor?.presenter = presenter
  }
}

extension ProductRouteWireframe: ProductWireframeProtocol {}
