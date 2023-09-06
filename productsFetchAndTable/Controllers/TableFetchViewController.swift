//
//  ViewController.swift
//  productsFetchAndTable
//
//  Created by Abdenoure Boudlal on 3/29/23.
//

import UIKit


class TableFetchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var productsArray = [Products]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchProductsData { (products) in
            self.productsArray = products
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
           
            //print(products)
//            for product in products{
//            }
        }
    }

    let productURL = "https://fakestoreapi.com/products"
    
    func fetchProductsData(completionHandler: @escaping ([Products]) -> Void){
        let url = URL(string: productURL)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            //print(data)
            guard let data = data else {return}
            
            do {
                let postsData = try JSONDecoder().decode([Products].self, from: data)
                
                completionHandler(postsData)
               
            }
            catch{
                let error = error
                print(error.localizedDescription)
                print(String(describing: error))

            }
        }
        
        .resume()
    }
}

extension TableFetchViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
            as! ProductsCell
        
        var product = productsArray[indexPath.row]

        let id = "\(String(describing: product.id!))"
//        cell.idCell.text = id
        cell.titleCell.text = product.title!
        let price = "\(String(describing: product.price!))"
        cell.priceCell.text = price + " $"
//        cell.descriptionCell.text = product.description!
        
        DispatchQueue.main.async {
            let url = URL(string: product.image)!
            if let data = try? Data(contentsOf: url) {
                cell.imageCell.image = UIImage(data: data)
            }
        }
//        cell.categoryCell.text = product.category!

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // var product = self.productsArray[indexPath.row]
        let selectedRow = indexPath.row
//        let singleProduct = ProductUniqViewController()
        
//        singleProduct.selectedCellData = productsArray[selectedRow]
//        print(singleProduct.selectedCellData)
        tableView.deselectRow(at: indexPath, animated: true)
//        guard let vc = storyboard?.instantiateViewController(withIdentifier: "go") as? ProductUniqViewController else{
//            return
//        }
//        present(singleProduct, animated: true, completion: nil)
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "view") as! ProductUniqViewController
        nextVC.selectedCellData = productsArray[selectedRow]
        self.navigationController?.pushViewController(nextVC, animated: true)
//        self.navigationController?.pushViewController(singleProduct, animated: true)
    }
    
}

