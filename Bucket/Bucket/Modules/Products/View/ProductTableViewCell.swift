//
//  ProductTableViewCell.swift
//  Bucket
//
//  Created by Dimil T Mohan on 2021/09/27.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "ProductTableViewCellIdentifier"

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func populate(item: ProductItem) {
        titleLabel.text = item.title
        detailsLabel.text = item.details
        priceLabel.text = item.price
        print(item.url)
        
        self.pictureImageView.setImage(uri: item.url, placeholder: UIImage(named: Constants.Placeholder.product)) { (image, error) in
            print(error)
            self.pictureImageView?.image = image ?? UIImage(named: Constants.Placeholder.product)
        }
    }
}
