//
//  NetworkAPI.swift
//  News
//
//  Created by Agnieszka Juraszek on 27/01/2023.
//

import Foundation

enum DataManagerError: Error {
    case parsingError
    case unsuccessfulResponse
    case noData
}

final class NetworkAPI {
    let baseURL: URL
    
    init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    func newsData() async throws -> AnyObject {
        // Create Data Task
        let request = URLRequest(url: baseURL)
        let data = try await URLSession.shared.data(for: request)
        return try tryParseData(data: data.0, response: data.1)
    }
    
    private func tryParseData(data: Data?, response: URLResponse?) throws -> AnyObject {
        if let data = data, let response = response as? HTTPURLResponse {
            if response.statusCode == 200 {
                return try parseData(data: data)
            } else {
                throw DataManagerError.unsuccessfulResponse
            }
        } else {
            throw DataManagerError.noData
        }
    }
    
    private func parseData(data: Data) throws -> AnyObject {
        if let object = try? JSONSerialization.jsonObject(with: data, options: []) as AnyObject {
            return object
        } else {
            throw DataManagerError.parsingError
        }
    }
}
