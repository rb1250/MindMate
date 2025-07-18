//
//  ContentView.swift
//  MindMate
//
//  Created by Ruchika Bokadia on 2025-07-15.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = PromptViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("🧠 MindMate")
                    .font(.largeTitle)
                    .bold()
                
                Text("\(viewModel.prompt)")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Button("Get Today's Prompt") {
                    // call getPrompt
                    Task {
                        await viewModel.getPrompt()
                    }
                }
                .padding()
                .buttonStyle(.borderedProminent)
                
            }
            .padding()
            .onAppear {
                // call getPrompt
                Task {
                    await viewModel.getPrompt()
                }
            }
        }
    }
}

#Preview {
    MainView()
}
