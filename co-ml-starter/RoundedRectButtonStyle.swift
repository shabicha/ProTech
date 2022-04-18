//
//  RoundedRectButtonStyle.swift
//  co-ml-starter
//
//  Created by Tiffany Tseng on 4/18/22.
//

import SwiftUI
import Foundation

struct RoundedRectButtonStyle: ButtonStyle {
    var buttonColor = Color.blue
    var textColor = Color.white
    var fullWidth = false
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            if (fullWidth) {
                Spacer()
            }
            configuration.label.foregroundColor(textColor)
            if (fullWidth) {
                Spacer()
            }
        }
        .padding()
        .background(configuration.isPressed ? buttonColor.opacity(0.7).cornerRadius(8) : buttonColor.cornerRadius(8))
    }
}
