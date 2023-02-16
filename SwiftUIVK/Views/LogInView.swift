//
//  LogInView.swift
//  SwiftUIVK
//


import SwiftUI

struct LogInView: View {
    @State private var login = ""
    @State private var password = ""
    @State private var shouldShowLogo = true
    @State private var showIncorrectCredentialsWarning = false
    
    @Binding var isUserLoggedIn: Bool
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                Image("vkBackground")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
            }
            ScrollView(showsIndicators: false) {
                VStack {
                    if shouldShowLogo {
                        VStack {
                            Image("vkLogo")
                                .resizable()
                                .frame(maxWidth: 100, maxHeight: 100)
                                .padding(.top, 30)
                                .padding(.bottom,30)
                            
                            Text("VKClone SwiftUI App")
                                .font(.largeTitle)
                                .padding(.top, 30)
                        }
                    }
                    
                    VStack {
                        HStack {
                            Text("Login:")
                            Spacer()
                            TextField("", text: $login)
                                .frame(maxWidth: 150)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                        }
                        HStack {
                            Text("Password:")
                            Spacer()
                            SecureField("", text: $password)
                                .frame(maxWidth: 150)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }
                        .frame(maxWidth: 250)
                        .padding(.top, 50)
                    
                        Button (action: { isUserDataCorrect() }) {
                            Text("LogIn")
                                .font(.title2)
                        }
                        .padding(.top, 50)
                        .padding(.bottom, 30)
                        .disabled(login.isEmpty || password.isEmpty)
                        .buttonStyle(.plain)
                }.alert(isPresented: $showIncorrectCredentialsWarning, content: { Alert(title: Text("Error"), message: Text("Incorrent Login/Password was entered"))
                })
            }
        }
    }
    private func isUserDataCorrect() {
        if login == "Foo" && password == "bar" {
           isUserLoggedIn = true
        } else {
            showIncorrectCredentialsWarning = true
        }
        password = ""
    }
}

//struct LogInView_Previews: PreviewProvider {
//    static var previews: some View {
//        LogInView(isUserLoggedIn: true)
//    }
//}
