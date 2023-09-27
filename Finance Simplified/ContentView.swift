//
//  ContentView.swift
//  Finance Simplified
//
//  Created by Pratham Juvekar on 5/12/23.
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
    @State var loginDisplay = ""
    @State var errorDisplay = ""
    
    
    var body: some View{
    
       // if isUserLoggedIn == true {
       //     second
       // } else if isUserLoggedIn == false {
         //   content
       // }
        second
    }
    
    var content: some View {
        NavigationView {
            ZStack{
                Background()
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
                        .background(Color.delftBlue)
                        .cornerRadius(10)
                        Text(loginDisplay)
                    }
                    if isLoginMode == true {
                        Button("Login"){
                            login()
                        }
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.delftBlue)
                        .cornerRadius(10)
                        Text(loginDisplay)
                    }
                    
                    Text(errorDisplay)
                        
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    //Setup for logining into account with Firebase
    func login() {
            Auth.auth().signIn(withEmail: email, password: password) {
                result, error in if error != nil {
                    errorDisplay = error!.localizedDescription
                } else {
                    isUserLoggedIn = true
                }
            }
            
        
        }
        
    //Setup for Registering Account with Firebase
    func register() {
            Auth.auth().createUser(withEmail: email, password: password) {
                result, error in if error != nil {
                    errorDisplay = error!.localizedDescription
                }
            }
        }
    
    func logOut() {
        isUserLoggedIn = false
    }
    
    var second: some View {
        NavigationView {
            VStack (){
                TabViewMain()
            }
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
