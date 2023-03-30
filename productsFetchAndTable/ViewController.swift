//
//  ViewController.swift
//  productsFetchAndTable
//
//  Created by Abdenoure Boudlal on 3/29/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fetchProductsData { (products) in
            
            for product in products{
                
                print(product.title ?? "id")

            }
        }
    }
    let productURL = "https://fakestoreapi.com/products"
    
    func fetchProductsData(completionHandler: @escaping ([Products]) -> Void){
        let url = URL(string: productURL)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            print(data)
            guard let data = data else {return}
            
            do {
                let postsData = try JSONDecoder().decode([Products].self, from: data)
                
                completionHandler(postsData)
            }
            catch{
                let error = error
                print(error.localizedDescription)
            }
        }
        
        .resume()
    }
    
}

