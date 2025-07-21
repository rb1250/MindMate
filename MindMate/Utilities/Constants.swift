//
//  Constants.swift
//  MindMate
//
//  Created by Ruchika Bokadia on 2025-07-16.
//
import Foundation

enum Constants {
    
    enum Keys {
        static let apiKey = "OPENAI_API_KEY"
        static let gptURL = "GPT_URL"
    }
    
    ///Getting plist here
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Failed to load info dictionary")
        }
        print(dict)
        return dict
    }()
    
    ///Get apiKey and gptUrl from plist
    
    static let openAIAPIKey: String = {
        guard let apiKey = Constants.infoDictionary[Keys.apiKey] as? String else {
            fatalError("API key not set in plist")
        }
        return apiKey
    }()
    
    static let gptURL: String = {
        guard let url = Constants.infoDictionary[Keys.gptURL] as? String else {
            fatalError("API key not set in plist")
        }
        return url
    }()
}
