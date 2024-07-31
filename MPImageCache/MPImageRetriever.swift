//
//  MPImageRetriever.swift
//  MPImageCache
//
//  Created by Manish Parihar on 31.07.24.
//

import Foundation

struct MPImageRetriever {
    
    func fetchImage(_ url:String) async throws -> Data {
        guard let url = URL(string: url) else {
            throw RetrieveError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
}

private extension MPImageRetriever {
    enum RetrieveError: Error {
        case invalidURL
    }
}
