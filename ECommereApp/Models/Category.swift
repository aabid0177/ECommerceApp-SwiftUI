//
//  CategoryModel.swift
//  Stylish
//
//  Created by Aabid Khan on 10/05/24.
//

import Foundation
class Category: Identifiable, ObservableObject {
    
    var id = UUID()
    let category: String
    let image: String
    @Published var isSelected: Bool = false
    
    init(id: UUID = UUID(), category: String, image: String, isSelected: Bool) {
        self.id = id
        self.category = category
        self.image = image
        self.isSelected = isSelected
    }
}
