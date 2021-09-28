//
//  SearchRoutePresenter.swift
//  TravelTracker
//
//  Created by Abhisek on 08/01/18.
//  Copyright © 2018 Abhisek. All rights reserved.
//

import UIKit

class ProductPresenter: ProductViewProtocol {
  var viewRef: ProductViewController?
  var wireframe: ProductRouteWireframe?
  var interactor: ProductInteractor?
  
  func viewDidLoad() {
      ProductRouteWireframe.loadSearchPageComponents(withPresenter: self)
      interactor?.fetachStoredData()
      interactor?.getProductListData()
  }
  
}

extension ProductPresenter: ProductInteractorOutputProtocol {
  
  //Called when the recent searches done by user is fetched from local DB
  func didFinishRetrieve(items: [ProductItem]?, error: Error?) {
    guard let results = items else {
      return
    }
    viewRef?.updateProductList(items: results, error: error)
  }
}


