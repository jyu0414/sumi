//
//  Login.swift
//  sumi
//
//  Created by Yuji Sasaki on 2020/03/09.
//  Copyright © 2020 Yuji Sasaki. All rights reserved.
//

import SwiftUI
import FirebaseAuth

struct Login: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var loggedIn: Bool = false
    @State var createUser: Bool = false
    var body: some View {
        VStack {
            Text("Login").font(.system(.title)).padding(.bottom, 8)
            HStack {
                Spacer()
                Text("Email")
                TextField("Enter your email address.", text: $email)
                Spacer()
            }.padding(.bottom, 8)
            HStack {
                Spacer()
                Text("Password")
                SecureField("Enter a password.", text: $password)
                Spacer()
            }.padding(.bottom, 8)
            HStack {
                Button(action: {
                    self.loggedIn = true
                    
                }, label: {Text("Sign in")}).sheet(isPresented: $loggedIn, content: {
                    GameSelector()
                    })
            }
            
        }
    }
}

struct Login_Previews: PreviewProvider {
   static var previews: some View {
       Login()
   }
}
