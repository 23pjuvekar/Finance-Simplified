//
//  Finance_SimplifiedApp.swift
//  Finance Simplified
//
//  Created by Pratham Juvekar on 5/12/23.
//

import SwiftUI
import Firebase


@main
struct Finance_SimplifiedApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
