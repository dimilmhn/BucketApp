//
//  ProductViewController.swift
//  Bucket
//
//  Created by Dimil T Mohan on 2021/09/27.
//

import UIKit

class ProductViewController: UIViewController {
    @IBOutlet weak var productTableView: UITableView!
    var presenter: ProductPresenter = ProductPresenter()
    var productList = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewRef = self
        configureTableView()
        presenter.viewDidLoad()
    }
    
    private func configureTableView() {
        productTableView.rowHeight = UITableView.automaticDimension
        productTableView.estimatedRowHeight = 266
    }
    
    fileprivate func updateWishList(_ product: Product) {
        presenter.updateWishList(item: product)
    }
}

//extension ProductViewController: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let offsetY = scrollView.contentOffset.y
//        let contentHeight = scrollView.contentSize.height
//
//        if (offsetY > contentHeight - scrollView.frame.height * 4) {
//            print("---------scrollViewDidScroll")
//        }
//    }
//}

extension ProductViewController: ProductPresenterProtocol {
    func updateProductList(items: [Product]?, error: Error?) {
        guard let list = items else { return }
        DispatchQueue.main.async {
            self.productList = list
            self.productTableView.reloadData()
        }
    }
    
    func didUpdateWishList() {
        DispatchQueue.main.async {
            self.productTableView.reloadData()
        }
    }
}


//MARK: UITableViewDataSource
extension ProductViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return productList.count
  }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = productTableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.cellIdentifier, for: indexPath) as? ProductTableViewCell else {  fatalError("Cell not available") }
        let product = productList[indexPath.row]
        cell.populate(product, presenter.hasAddedToWishList(item: product))
        cell.onWishListClicked = { [weak self] product in
            self?.updateWishList(product)
        }
        return cell
    }
}

//MARK: UITableViewDelegate
extension ProductViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
}


extension UIScrollView {
    var maxVerticalContentOffset: CGFloat {
        return contentSize.height - bounds.height + contentInset.bottom
    }
}
