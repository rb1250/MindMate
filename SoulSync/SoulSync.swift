//
//  SoulSync.swift
//  SoulSync
//
//  Created by Ruchika Bokadia on 2025-07-15.
//

import SwiftUI

@main
struct SoulSync: App {
    @State private var showLaunchScreen = true
    
    var body: some Scene {
        WindowGroup {
            if showLaunchScreen {
                LaunchScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                showLaunchScreen = false
                            }
                        }
                    }
            } else {
                MainView() // Your actual main view
            }
        }
    }
}
