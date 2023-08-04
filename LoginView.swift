//
//  LoginView.swift
//  group_app
//
//  Created by Emily Markova on 7/31/23.
//

import SwiftUI
import Foundation

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                //header
                HeaderView(title: "accompliSHARE", angle: 0, background: .black, height: 100)
//                    .offset(y: -50)
                Image(systemName: "circle.hexagonpath")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width / 3)
                    .padding(.bottom, 80)
                Spacer()
                
                
                //create account
                VStack {
                    Form{
                        if !viewModel.errorMessage.isEmpty{
                            Text(viewModel.errorMessage)
                                .foregroundColor(Color.red)
                        }
                        TextField("Email address", text: $viewModel.email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocapitalization(.none)
                            .autocorrectionDisabled()
                        SecureField("Password", text: $viewModel.password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TLButton(title: "Log In", background: Color(red: 131/255, green: 197/255, blue: 190/255)){
                            //Attempt to log in
                            viewModel.login()
                        }
                        .padding()
                    }
                    Text("New around here?")
                    NavigationLink("Create an Account", destination: RegisterView())
                }
                .padding(.bottom, 10)
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Align VStack to the bottom
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
