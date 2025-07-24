//
//  LaunchScreenView.swift
//  SoulSync
//
//  Created by Ruchika Bokadia on 2025-07-24.
//
import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.purple, .blue],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            VStack(spacing: 10) {
                Image("LaunchIcon") // Replace with your asset name
                    .resizable()
                    .frame(width: 300, height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
            }
        }
    }
}

#Preview {
    LaunchScreenView()
}

