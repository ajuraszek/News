//
//  NewsFeedViewModel.swift
//  News
//
//  Created by Agnieszka Juraszek on 20/01/2023.
//

import Foundation

final class NewsFeedViewModel {
    
    let api: NetworkAPI
    
    init() {
        api = NetworkAPI(baseURL: NetworkConfiguration.url)
        Task {
            let containerResponse = try await api.newsData() as? NewsContainerResponse
            let news = NewsMapper.map(from: containerResponse)
            print(news.count)
        }
    }
}
