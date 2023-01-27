//
//  NetworkConfiguration.swift
//  News
//
//  Created by Agnieszka Juraszek on 27/01/2023.
//

import Foundation

struct NetworkConfiguration {
    static let apiKey = "AcmIEoAAWsmYgCZ8ZcAbctxGrp6wzs1q"
    
    static var url: URL {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.nytimes.com"
        components.path = "/svc/topstories/v2/home.json"
        components.queryItems = [
            URLQueryItem(name: "api-key", value: apiKey)
        ]
        
        return components.url!
    }
}
