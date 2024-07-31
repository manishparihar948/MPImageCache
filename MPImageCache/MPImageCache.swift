//
//  MPImageCache.swift
//  MPImageCache
//
//  Created by Manish Parihar on 31.07.24.
//

import Foundation

class MPImageCache {
    typealias CacheType = NSCache<NSString, NSData>
    
    static let shared = MPImageCache()
    
    private init() {}
    
    private lazy var cache: CacheType = {
        let cache = CacheType()
        cache.countLimit = 100
        cache.totalCostLimit = 50 * 1024 * 1024
        return cache
    }()
    
    func object(forKey key: NSString) -> Data? {
        cache.object(forKey: key) as? Data
    }
    
    func set(object: NSData, forKey key: NSString) {
        cache.setObject(object, forKey: key)
    }
}
