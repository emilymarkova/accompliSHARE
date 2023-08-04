//
//  Following.swift
//  accompliSHARE1
//
//  Created by Gnapika Birlangi on 8/2/23.
//

import SwiftUI

struct FollowingView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color(.init(genericCMYKCyan: 0.00, magenta: 0.00, yellow: 0.00, black: 0.41, alpha: 0.55))
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 20.0) {
                    HStack {
                        Text("                                                           ")
                        Button("Done") {
                            dismiss()
                        }
                    }
                    
                    Text("Following")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, 20)
                        .padding(.top, -10)
                    
                    HStack {
                        VStack (alignment: .leading, spacing: 6.0){
                            Image("dog")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                                .padding([.trailing], 10.0)
                            Image("flowers-m")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                                .padding([.top, .trailing], 10.0)
                            Image("cookie")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                                .padding([.top, .trailing], 10.0)
                            Image("taylor")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                                .padding([.top, .trailing], 10.0)
                            Image("rock")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                                .padding([.top, .trailing], 10.0)
                            Image("alicia")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                                .padding([.top, .trailing], 10.0)
                            Image("Aayushi")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                                .padding([.top, .trailing], 10.0)
                        }
                        VStack (alignment: .leading, spacing: 20.0) {
                            
                            Text("Gnapika Birlangi")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text("Michelle Han")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text("Rachel Yoon")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text("Taylor Swift")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text("The Rock")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text("Alicia Chiang")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text("Aayushi Garg")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.bottom, -0.01)
                        }
                    }
                    
                }
            }
            .padding()
            .background(Color(red: 156/255, green: 236/255, blue: 156/255))
            .cornerRadius(35)
            
           
            }
    }
}

struct FollowingView_Previews: PreviewProvider {
    static var previews: some View {
        FollowingView()
    }
}
