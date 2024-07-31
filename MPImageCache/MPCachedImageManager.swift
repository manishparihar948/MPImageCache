//
//  MPCachedImageManager.swift
//  MPImageCache
//
//  Created by Manish Parihar on 31.07.24.
//

import Foundation
import Observation

@Observable final class MPCachedImageManager {
    private(set) var currentState : CurrentState?
    
    private let imageRetrieverr = MPImageRetriever()
    
    @MainActor
    func load(_ url: String, cache: MPImageCache = .shared) async {
        self.currentState = .loading
        
        if let imageData = cache.object(forKey: url as NSString) {
            self.currentState = .success(data: imageData)
            return
        }
        
        do {
            let data = try await imageRetrieverr.fetchImage(url)
            self.currentState = .success(data: data)
            cache.set(object: data as NSData, forKey: url as NSString)
        } catch  {
            self.currentState = .failed
        }
    }
    
}

extension MPCachedImageManager {
    enum CurrentState {
        case loading
        case failed
        case success(data: Data)
    }
}
