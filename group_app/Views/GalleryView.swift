//
//  GalleryView.swift
//  group_app
//
//  Created by Emily Markova on 7/31/23.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("Friends View")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            
        }
        .navigationTitle("Friends")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
