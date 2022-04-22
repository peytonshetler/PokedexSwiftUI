//
//  NavigationLazyView.swift
//  PokedexSwiftUI
//
//  Created by Peyton Shetler on 4/21/22.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
