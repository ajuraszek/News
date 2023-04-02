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
    
    func fetch<T: Decodable>() async throws -> T {
        // Create Data Task
        let request = URLRequest(url: baseURL)
        let data = try await URLSession.shared.data(for: request)
        return try tryParseData(data: data.0, response: data.1)
    }
    
    private func tryParseData<T: Decodable>(data: Data?, response: URLResponse?) throws -> T {
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
    
    private func parseData<T: Decodable>(data: Data) throws -> T {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        if let object = try? decoder.decode(T.self, from: data) {
            return object
        } else {
            throw DataManagerError.parsingError
        }
    }
}
