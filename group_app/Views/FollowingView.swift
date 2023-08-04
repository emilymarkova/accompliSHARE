//
//  Following.swift
//  accompliSHARE1
//
//  Created by Gnapika Birlangi on 8/2/23.
//

import SwiftUI

struct FollowingView: View {
    var body: some View {
        ZStack {
            Color(.init(genericCMYKCyan: 0.00, magenta: 0.00, yellow: 0.00, black: 0.41, alpha: 0.55))
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 20.0) {
                Text("                                           ")
                Text("Following")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 50)
                    .padding(.top, -10)
                Text("Michelle Han")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("Emily Markova")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("Gnapika Birlangi")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("Rachel Yoon")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("Taylor Swift")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("Alicia Chiang")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("Aayushi Garg")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.bottom, -0.01)
                Text("                                                                         ")
            }
            .padding()
            .background(Color(red: 156/255, green: 236/255, blue: 156/255))
            .cornerRadius(35)
        }    }
}

struct FollowingView_Previews: PreviewProvider {
    static var previews: some View {
        FollowingView()
    }
}
