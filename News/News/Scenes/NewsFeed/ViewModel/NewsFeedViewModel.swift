//
//  NewsFeedViewModel.swift
//  News
//
//  Created by Agnieszka Juraszek on 20/01/2023.
//

import Foundation
import SwiftUI

final class NewsFeedViewModel: ObservableObject {
    
    let api: NetworkAPI
    private var news: [News] = [] {
        didSet {
            newsViewData = news.map { NewsViewDataFactory.create(from: $0) }
        }
    }
    @Published var newsViewData: [NewsViewData] = []
    
    init() {
        api = NetworkAPI(baseURL: NetworkConfiguration.url)
        Task {
            let containerResponse: NewsContainerResponse = try await api.fetch()
            news = NewsMapper.map(from: containerResponse)
            print(news.count)
        }
    }
}
