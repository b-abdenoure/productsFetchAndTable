//
//  ProductUniqViewController.swift
//  productsFetchAndTable
//
//  Created by Boudlal Abdenoure on 31/8/2023.
//

import UIKit

class ProductUniqViewController: UIViewController {
        var selectedCellData: Products!

        
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let safeData = selectedCellData else{
            print("data is not safe\(self.selectedCellData)")
        return
            
        }
        print(safeData)
        
//        print(safeTitle)
        titleProduct?.text = safeData.title
        DispatchQueue.main.async {
            let url = URL(string: safeData.image)!
            if let data = try? Data(contentsOf: url) {
                self.imageProduct.image = UIImage(data: data)
            }
        }
//        imageProduct.image = UIImage(named: safeData.image)
        descriptionProduct.text = safeData.description
        categoryProduct.text = safeData.category
        idProduct.text = String(safeData.id)
        priceProduct.text = String(safeData.price)
//        if let safe = selectedCellData?.title {
//            // Use unwrappedData here
//            print("Received data: \(safe)")
//        } else {
//            // Handle the case where selectedData is nil
//            print("No data received")
//        }
//            titleProduct.text = safeTitle
        
        
        
//        let vc = TableFetchViewController()
//print(selectedCellData as Any)
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var titleProduct: UILabel!
    @IBOutlet weak var descriptionProduct: UILabel!
    @IBOutlet weak var categoryProduct: UILabel!
    @IBOutlet weak var idProduct: UILabel!
    @IBOutlet weak var priceProduct: UILabel!

    
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
