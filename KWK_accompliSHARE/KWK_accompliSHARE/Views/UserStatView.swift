//
//  UserStatView.swift
//  accompliSHARE1
//
//  Created by Rachel Yoon on 8/3/23.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let digit: String
    let title: String
    var body: some View {
        HStack {
            Text("\(value)" + "\(digit)")
                .font(.headline)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            
            Text(title)
                .font(.headline)
                .multilineTextAlignment(.leading)
            Spacer()
        }
        .padding(.horizontal, 50.0)
    }
}

struct UserStatView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatView(value: 5, digit: "M", title: "Followers")
    }
}
