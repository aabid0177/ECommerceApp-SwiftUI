//
//  File.swift
//  Stylish
//
//  Created by Aabid Khan on 07/05/24.
//

import Foundation
import SwiftUI

// MARK: - INTRO DATA MODEL

struct IntroData: Identifiable {
  var id = UUID()
  var title: String
  var desc: String
  var image: String
}
