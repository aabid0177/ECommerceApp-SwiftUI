//
//  HomeViewModel.swift
//  Stylish
//
//  Created by Aabid Khan on 24/05/24.
//

import Foundation
import Alamofire

class HomeViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    @Published var categories: [String] = []
    @Published var failureMessage: String = ""
    
    func fetchAllProducts() {
        AF.request(BASE_URL + ApiEndPoints.allProducts)
            .responseDecodable(of: [Product].self) { response in
                switch response.result {
                case .success(let products):
                    self.products = products
                case .failure(let error):
                    self.failureMessage = error.localizedDescription
                }
            }
    }
    
    func fetchAllProductsSort() {
        AF.request(BASE_URL + ApiEndPoints.allProductsSort + "desc")
            .responseDecodable(of: [Product].self) { response in
                switch response.result {
                case .success(let products):
                    self.products = products
                case .failure(let error):
                    self.failureMessage = error.localizedDescription
                }
            }
    }
    
    func fetchAllCategories() {
        AF.request(BASE_URL + ApiEndPoints.allCategories)
            .responseDecodable(of: [String].self) { response in
                switch response.result {
                case .success(let categories):
                    self.categories = categories
                case .failure(let error):
                    self.failureMessage = error.localizedDescription
                }
            }
    }
    
    func fetchGetInCategory(categoryName: String) {
        AF.request(BASE_URL + ApiEndPoints.particularCategory + "/" + categoryName)
            .responseDecodable(of: [Product].self) { response in
                switch response.result {
                case .success(let products):
                    self.products = products
                case .failure(let error):
                    self.failureMessage = error.localizedDescription
                }
            }
    }
}
