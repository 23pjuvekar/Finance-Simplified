//
//  Background.swift
//  Finance Simplified
//
//  Created by Pratham Juvekar on 6/8/23.
//

import SwiftUI

struct Background: View {
    var body: some View {
        Color.delftBlue.ignoresSafeArea()
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
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background()
    }
}
