//
//  StatesModal.swift
//  Stylish
//
//  Created by Aabid Khan on 23/05/24.
//

import Foundation
// MARK: - States
struct StatesList: Codable {
    let states: [StateDetail]
}

// MARK: - State
struct StateDetail: Codable {
    let state: String
    let districts: [String]
}
