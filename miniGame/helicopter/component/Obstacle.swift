//
//  Obstacle.swift
//  miniGame
//
//  Created by james on 2021/09/02.
//

import SwiftUI

struct Obstacle: View {
    
    let width: CGFloat = 20
    let height: CGFloat = 200
    
    var body: some View {
        Rectangle()
            .frame(width: width, height: height)
            .foregroundColor(.green)
    }
}

struct Obstacle_Previews: PreviewProvider {
    static var previews: some View {
        Obstacle()
    }
}
