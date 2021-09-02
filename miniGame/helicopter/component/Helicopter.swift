//
//  Helicopter.swift
//  miniGame
//
//  Created by james on 2021/09/02.
//

import SwiftUI

struct Helicopter: View {
    
    let rows = 5
    let cols = 5
    let size: CGFloat = 10
    let heliBlocks: [[Color]] = [[.gray, .gray, .gray, .gray, .gray],
                                 [.clear, .clear, .blue, .clear, .clear],
                                 [.blue, .blue, .blue, .blue, .green],
                                 [.clear, .clear, .blue, .blue, .blue],
                                 [.clear, .clear, .blue, .blue, .blue]]
    
    var body: some View {
        VStack(spacing:0) {
            ForEach((0...rows - 1), id: \.self) { row in
                HStack(spacing:0) {
                    ForEach((0...cols - 1), id: \.self) { col in
                        VStack {
                            Pixel(size: size, color: heliBlocks[row][col])
                        }
                        
                    }
                }
                
            }
        }
    }
}

struct Helicopter_Previews: PreviewProvider {
    static var previews: some View {
        Helicopter()
    }
}
