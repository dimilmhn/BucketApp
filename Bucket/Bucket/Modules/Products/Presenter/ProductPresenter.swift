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
        ProductRouteWireframe.loadProductComponents(withPresenter: self)
        interactor?.fetachStoredProducts()
        interactor?.getProducts()
    }
    
    func hasAddedToWishList(item: Product) -> Bool {
        let wishList = interactor?.fetachWishList()
        return wishList?.contains(where: { $0.id == item.id }) ?? false
    }
    
    func updateWishList(item: Product) {
        interactor?.updateWishList(item)
    }
}

extension ProductPresenter: ProductInteractorOutputProtocol {
    func didFinishFetch(items: [Product]?, error: Error?) {
        viewRef?.updateProductList(items: items, error: error)
    }
    
  
    func didFinishRetrieve(items: [Product]?, error: Error?) {
        viewRef?.updateProductList(items: items, error: error)
    }
    
    func didWishListUpdate() {
        viewRef?.didUpdateWishList()
    }
}


