//
//  UtilityExtensions.swift
//  miniGame
//
//  Created by james on 2021/10/12.
//

import SwiftUI

// in a Collection of Identifiables
// we often might want to find the element that has the same id
// as an Identifiable we already hav in hand
// we name this index(matching:) instead of firstIndex(matching:)
// because we assume that someone creating a Collection of Identifiable
// is usually going to have only one of each Identifiable thing in there
// (though there's nothing to restrict them from doing so; it's just a naming choice)

extension Collection where Element: Identifiable {
    func index(mathing element: Element) -> Self.Index? {
        firstIndex(where: { $0.id == element.id })
    }
}