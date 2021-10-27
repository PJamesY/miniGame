//
//  UtilityViews.swift
//  miniGame
//
//  Created by james on 2021/10/27.
//

import SwiftUI

struct OptionalImage: View {
    var uiImage: UIImage?
    
    var body: some View {
        if uiImage != nil {
            Image(uiImage: uiImage!)
        }
    }
}
