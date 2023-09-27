//
//  TabViewMain.swift
//  Finance Simplified
//
//  Created by Pratham Juvekar on 9/11/23.
//

import SwiftUI

struct TabViewMain: View {
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Image(systemName: "house" )
                    Text("Home")
                }
            Charts()
                .tabItem {
                    Image(systemName: "chart.dots.scatter")
                    Text("Charts")
                }
        }
        .toolbarBackground(Color.smokyBlack, for: .tabBar)
    }
}

struct TabViewMain_Previews: PreviewProvider {
    static var previews: some View {
        TabViewMain()
    }
}
