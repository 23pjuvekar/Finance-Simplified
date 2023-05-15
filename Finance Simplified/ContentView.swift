//
//  ContentView.swift
//  Finance Simplified
//
//  Created by Pratham Juvekar on 5/12/23.
//

import SwiftUI
import Firebase


struct ContentView: View {
    // For login Screen
    @State private var email = ""
    @State private var password = ""
    @State private var wrongEmail = 0
    @State private var wrongPassword = 0
    @State var isLoginMode = false
    @State var isUserLoggedIn = false
    @State var loginError = ""

    var body: some View{
        if isUserLoggedIn {
            secondaryScreen()
        } else {
            content
        }
    }
    
    var content: some View {
        NavigationView {
            ZStack{
                Color.green.ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.35))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                Image(systemName: "dollarsign.square.fill")
                    .font(.system(size: 72, weight: .light))
                    .padding(.bottom, 340)
                    .offset(x: -100)
                Text("Finance")
                    .font(.system(size: 50))
                    .offset(y: -170)
                    .offset(x: 20)
                VStack {
                    Picker(selection: $isLoginMode, label: Text("Picker here")){
                        Text("Login")
                            .tag(true)
                        Text("Create Account")
                            .tag(false)
                    }.pickerStyle(SegmentedPickerStyle())
                        .scaleEffect(CGSize(width: 0.95, height: 0.95))
                        .offset(y: 15)
                    Text(isLoginMode ? "Login" : "Create Account")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Email", text: $email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongEmail))
                        .keyboardType(.emailAddress)
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                        .keyboardType(.emailAddress)

                    if isLoginMode == false {
                    
                        Button("Create Account"){
                            register()
                        }
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(.green)
                        .cornerRadius(10)
                        
                        Text(loginError)
                        
                        
                    }
                    
                    if isLoginMode == true {
                        
                        Button("Login"){
                            login()
                        }
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(.green)
                        .cornerRadius(10)
                        
                    }
                    
                    
                }
                .onAppear {
                    Auth.auth().addStateDidChangeListener { auth, user in if user != nil {
                        isUserLoggedIn.toggle()
                    }
                    }
                }
                
                
            }
            .navigationBarHidden(true)
        }
    }
    
    //Setup for logining into account with Firebase
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) {
            result, error in if error != nil {
                print(error!.localizedDescription)
                loginError = "Failed to create user:"
            }
        }
        
    }
    
    //Setup for Registering Account with Firebase
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) {
            result, error in if error != nil {
                print(error!.localizedDescription)
                loginError = "Sucessfully Created User"
            }
        }
    }
    
}


struct secondaryScreen: View {
    
    var body: some View{
        NavigationView {
            ZStack{
                Color.white.ignoresSafeArea()
                Rectangle()
                .size(width: 500, height: 200)
                .offset(y: -180)
                .foregroundColor(.green)
                
                VStack{
                    Button("Log out") {
                            
                        }
                    .foregroundColor(.black)
                    .frame(width: 80, height: 40)
                    .background(.white)
                    .cornerRadius(10)
                    .offset(y: -365)
                    .offset(x: 135)
                    
                    Text("Finance Simplified")
                        .font(.largeTitle)
                        .bold()
                    
                    }
                    
    
                    
                }
            }
            
            
            
        }
    }
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
