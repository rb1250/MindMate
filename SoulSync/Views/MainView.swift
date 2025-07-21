//
//  ContentView.swift
//  SoulSync
//
//  Created by Ruchika Bokadia on 2025-07-15.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = PromptViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                // ✨ Background Gradient
                LinearGradient(gradient: Gradient(colors: [Color(.systemPurple), Color(.systemTeal)]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // 🧠 App Title
                    VStack(spacing: 4) {
                        Text("🧠 SoulSync")
                            .font(.system(size: 34, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        
                        Text("Whispers for your mind ✨")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.85))
                    }
                    .padding(.top, 50)
                    
                    // 💬 Prompt Display
                    Spacer()
                    Group {
                        if viewModel.isLoading {
                            ProgressView("Listening to the universe...")
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        } else if viewModel.isError {
                            Text("⚠️ Error fetching prompt")
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding()
                        } else if !viewModel.prompt.isEmpty {
                            VStack(spacing: 16) {
                                Text("🌿")
                                    .font(.system(size: 40))
                                
                                Text("“\(viewModel.prompt)”")
                                    .font(.title2.italic())
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .background(Color.white.opacity(0.2))
                                    .cornerRadius(18)
                                    .shadow(radius: 6)
                                    .padding(.horizontal)
                                
                                Text("🦋")
                                    .font(.system(size: 40))
                            }
                            .animation(.easeInOut(duration: 0.6), value: viewModel.prompt)
                        } else {
                            Text("Tap below to receive today’s mindful prompt 🌸")
                                .foregroundColor(.white.opacity(0.85))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                    }
                    
                    // ✨ Generate Button
                    Button(action: {
                        Task {
                            await viewModel.getPrompt()
                        }
                    }) {
                        HStack {
                            Image(systemName: "sparkles")
                            Text("Generate Prompt")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.9))
                        .foregroundColor(.purple)
                        .cornerRadius(14)
                        .shadow(radius: 3)
                        .padding(.horizontal)
                    }
                    
                    // ❤️ Footer
                    Spacer()
                    Text("Built with calm, curiosity, and code 💖")
                        .font(.footnote)
                        .foregroundColor(.white.opacity(0.7))
                        .padding(.bottom, 10)
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.getPrompt()
            }
        }
    }
}

#Preview {
    MainView()
}
