//
//  ProductCell.swift
//  productsFetchAndTable
//
//  Created by Abdenoure Boudlal on 3/31/23.
//

import UIKit


class ProductsCell: UITableViewCell{
    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var descriptionCell: UILabel!
    @IBOutlet weak var categoryCell: UILabel!
    @IBOutlet weak var idCell: UILabel!
    @IBOutlet weak var priceCell: UILabel!
    override func prepareForReuse() {
        super.prepareForReuse()
        imageCell.image = #imageLiteral(resourceName: "IOS_logo")
        titleCell.text = "1"
        descriptionCell.text = "1"
        categoryCell.text = "1"
        idCell.text = "1"
        priceCell.text = "1"
    }
    
}
