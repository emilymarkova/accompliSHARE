//
//  HeaderView.swift
//  group_app
//
//  Created by Emily Markova on 7/31/23.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let angle: Double
    let background: Color
    let height: Double
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            VStack() {
                //Text("accompliSHARE")
                Spacer()
                Text(title)
                    .font(.system(size:50))
                    .foregroundColor(Color.white)
                    .bold()
                    //.padding(.bottom, 10)
            }
            .padding(.top, 30)
        }
        .frame(width: UIScreen.main.bounds.width*3, height: height)
        .offset(y:-100)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "accompliSHARE", angle: 15, background: .blue, height: 300)
    }
}
