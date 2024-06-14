//
//  Constants.swift
//  Stylish
//
//  Created by Aabid Khan on 03/05/24.
//

import Foundation
import SwiftUI
import UIKit

struct K {
    
    static let baseWidh = 375.0
    static let baseHeight = 812.0
    
    struct Fonts {
        static let themeSemiBold = "Montserrat-SemiBold"
        static let themeRegular = "Montserrat-Regular"
        static let themeBold = "Montserrat-Bold"
        static let themeMedium = "Montserrat-Medium"
        static let themeExtraBold = "Montserrat-ExtraBold"
    }
    
    struct Colors {
        static let pink = UIColor(Color("Pink", bundle: nil))
        static let textColorGray = UIColor(Color("TextColorGray", bundle: nil))
        static let borderColorGray = UIColor(Color("BorderColorGray", bundle: nil))
        static let iconColorGray = UIColor(Color("IconColorGray", bundle: nil))
    }
    
    struct Size {
        static let buttonWidth = (UIScreen.screenWidth * 85) / 100
        static let buttonHeight = 55.0
        
        static func widthInProportionOfScreen(width: CGFloat) -> CGFloat {
            let percent = (width * 100) / K.baseWidh
            return (percent * UIScreen.screenWidth) / 100
        }
        
        static func heightInProportionOfScreen(height: CGFloat) -> CGFloat {
            let percent = (height * 100) / K.baseHeight
            return (percent * UIScreen.screenHeight) / 100
        }
    }
}
