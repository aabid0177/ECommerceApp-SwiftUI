//
//  ResponseStructure.swift
//  Stylish
//
//  Created by Aabid Khan on 09/05/24.
//

import Foundation

struct LoginParameters: DictionaryConvertor {
    let username: String
    let password: String
}

struct LoginResponse: Codable, DictionaryConvertor {
  let token: String
}
