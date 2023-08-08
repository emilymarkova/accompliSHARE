//
//  KarlieKlossView.swift
//  accompliSHARE1
//
//  Created by Michelle Han on 8/2/23.
//


import SwiftUI

struct KarlieKlossView: View {
    var body: some View {
        VStack {
            Text("Karlie Kloss Profile")
            Image("karliekloss")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
        }
    }
}

