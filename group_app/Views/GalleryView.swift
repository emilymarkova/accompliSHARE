//
//  GalleryView.swift
//  accompliSHARE1
//
//  Created by Rachel Yoon on 8/3/23.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
        VStack {
            Text("Gallery")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 10)
            Divider()
            
            ScrollView {
        
                VStack(alignment: .leading) {
                Text("Michelle Han [02/14/23]")
                        .buttonStyle(.borderedProminent)
                        .fontWeight(.thin)
                        .foregroundColor(Color.black)
                    
                Image("Michelle")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                                
                Text("                                                                                                                           Rachel Yoon [02/15/23]")
                        .buttonStyle(.borderedProminent)
                        .padding(.top, 10)
                        .fontWeight(.thin)
                        .foregroundColor(Color.black)
                Image("Rachel")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                
                Text("                                                                                                                           Alicia Chiang [02/20/23]")
                        .buttonStyle(.borderedProminent)
                        .padding(.top, 10)
                        .fontWeight(.thin)
                        .foregroundColor(Color.black)
                Image("Alicia1")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                
                Text("                                                                                                                           Aayushi Garg [02/25/23]")
                        .buttonStyle(.borderedProminent)
                        .padding(.top, 10)
                        .fontWeight(.thin)
                        .foregroundColor(Color.black)
                Image("Aayushi1")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
            }
        }
            .padding()
            .cornerRadius(25)
            .padding()
            .padding()
            .padding(.bottom, 50)
            .padding(.top, -20)
        }
        
    
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
