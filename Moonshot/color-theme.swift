//
//  color-theme.swift
//  Moonshot
//
//  Created by Edgardo Valencia on 27/12/24.
//

import SwiftUI

//Extend ShpeStyle only where is being used as Color
extension ShapeStyle where Self == Color {
    static var darkBackground: Color {
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }
    
    static var lightBackground: Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
}
