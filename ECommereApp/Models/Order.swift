//
//  Order.swift
//  Stylish
//
//  Created by Aabid Khan on 16/05/24.
//

import Foundation

class Order: ObservableObject {
    
    @Published var products = [OrderProduct]()
    @Published var total: Double = 0.0
    
    func updateTotal() {
        if products.count > 0 {
            total = products.reduce(0) { $0 + $1.totalPrice }
        } else {
            total = 0
        }
    }
    
    func add(product: OrderProduct) {
        products.append(product)
    }
    
    func remove(productToRemove: OrderProduct) {
        products.removeAll { product in
            productToRemove.id == product.id
        }
        updateTotal()
    }
    
    func isProductAddedToCart(productId: Int) -> Bool {
        (products.first { prod in
            prod.id == productId
        } != nil)
    }
}

class OrderProduct: ObservableObject {
    let id: Int
    let title: String
    let price: Double
    let description, category: String
    let image: String
    let rating: Rating?
    
    @Published var size: Int = 40
    @Published var quantity = 1
    
    var sizeArray = [40, 41, 42, 43, 44]
    var quantityArray = [1, 2, 3, 4, 5]
    
     var totalPrice: Double {
        price * Double(quantity)
    }
    
    init(id: Int, title: String, price: Double, description: String, category: String, image: String, rating: Rating?) {
        self.id = id
        self.title = title
        self.price = price
        self.description = description
        self.category = category
        self.image = image
        self.rating = rating
    }
}

class WishListData: ObservableObject {
    
    @Published var products = [Product]()
    
    func add(product: Product) {
        products.append(product)
    }
    
    func remove(productToRemove: Product) {
        products.removeAll { product in
            productToRemove.id == product.id
        }
      
    }
    
    func isProductAddedToWishList(productId: Int) -> Bool {
        (products.first { prod in
            prod.id == productId
        } != nil)
    }
}
