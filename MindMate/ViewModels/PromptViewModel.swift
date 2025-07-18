//
//  PromptViewModel.swift
//  MindMate
//
//  Created by Ruchika Bokadia on 2025-07-16.
//
import Foundation

@MainActor
public class PromptViewModel: ObservableObject {
    @Published public var prompt: String = "Loading..."
    @Published public var isLoading: Bool = false
    
    func getPrompt() async {
        isLoading = true
        do {
            let result = try await GPTService.shared.fetchPrompt()
            prompt = result
        } catch {
            prompt = "Error fetching prompt"
        }
        isLoading = false
    }

}
