//
//  Pixel.swift
//  miniGame
//
//  Created by james on 2021/09/02.
//

import SwiftUI

struct Pixel: View {
    let size: CGFloat
    let color: Color
    
    var body: some View {
        Rectangle()
            .frame(width: size, height: size)
            .foregroundColor(color)
        
    }
}
