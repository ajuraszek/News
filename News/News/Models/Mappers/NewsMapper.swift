//
//  NewsMapper.swift
//  News
//
//  Created by Agnieszka Juraszek on 27/01/2023.
//

import Foundation

enum NewsMapper {
    static func map(from containerResponse: NewsContainerResponse?) -> [News] {
        return containerResponse?.results?.compactMap { map(from: $0) } ?? []
    }
    
    private static func map(from response: NewsResponse?) -> News? {
        guard let response else { return nil }
        return News(
            title: response.title ?? "",
            info: response.abstract ?? "",
            date: response.publishedDate,
            imageUrl: response.multimedia?.last??.url
        )
    }
}
