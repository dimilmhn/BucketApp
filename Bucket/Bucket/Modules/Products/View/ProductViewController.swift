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
    var productList = [ProductItem]()
    
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
}

extension ProductViewController: ProductPresenterProtocol {
    func updateProductList(items: [ProductItem]?, error: Error?) {
        guard let list = items else { return }
        DispatchQueue.main.async {
            self.productList = list
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
        cell.populate(item: productList[indexPath.row])
        return cell
    }
}

//MARK: UITableViewDelegate
extension ProductViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
}
