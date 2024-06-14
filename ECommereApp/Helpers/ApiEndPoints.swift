//
//  ApiManager.swift
//  Stylish
//
//  Created by Aabid Khan on 08/05/24.
//

import Foundation
import Alamofire

public typealias FailureMessage = String
let BASE_URL = "https://fakestoreapi.com/"

struct ApiEndPoints {
    static let login = "auth/login"
    static let allProducts = "products"
    static let allCategories = "products/categories"
    static let allProductsSort = "products?sort="
    static let particularCategory = "products/category"
    static let users = "users"
}
