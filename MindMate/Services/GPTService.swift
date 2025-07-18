//
//  GPTService.swift
//  MindMate
//
//  Created by Ruchika Bokadia on 2025-07-16.
//
import Foundation

// Mark: - Data Model

struct Message: Codable {
    let role: String
    let content: String
}

struct RequestBody: Codable {
    let model: String
    let messages: [Message]
    let temprature: Double
}

struct GPTChoice: Codable {
    let message: Message
}

struct GPTResponse: Codable {
    let choices: [GPTChoice]
}

// Mark: - GPT Service
class GPTService {
    static let shared = GPTService()
    
    func fetchPrompt() async throws -> String {
        
        let promptMessage = Message(
            role: "system",
            content: "You are a gentle journaling coach. Generate one deep but simple question the user can reflect on today. Keep it under 20 words."
        )
        
        let requestBody = RequestBody(
            model: "gpt-3.5-turbo",
            messages: [promptMessage],
            temprature: 0.7
        )
        
        let jsonEncoder = JSONEncoder()
        guard let dataToSend = try? jsonEncoder.encode(requestBody) else {
            fatalError("Could not encode JSON")
        }
        
        guard let url = URL(string: Constants.gptURL) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(Constants.openAIAPIKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("OpenRouter-Ruchika", forHTTPHeaderField: "HTTP-Referer")
        
        request.httpBody = dataToSend
        
        let (data, _) = try await URLSession.shared.data(for: request)
        print("RAW JSON:")
        print(String(data: data, encoding: .utf8) ?? "Invalid response") // 👈 Add this line
        let decoded = try JSONDecoder().decode(GPTResponse.self, from: data)
        
        return decoded.choices.first?.message.content ?? "No prompt found."
    }
    
}
