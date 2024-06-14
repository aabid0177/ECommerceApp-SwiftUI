//
//  ProductDetailViewModel.swift
//  Stylish
//
//  Created by Aabid Khan on 24/05/24.
//

import Foundation


import Alamofire

class ProductDetailViewModel: ObservableObject {
    
    @Published var product: Product?
    
    func fetchProduct(productId: String) {
        AF.request(BASE_URL + ApiEndPoints.allProducts + "/" + productId)
            .responseDecodable(of: Product.self) { response in
                switch response.result {
                case .success(let product):
                    self.product = product
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
