//
//  NewsViewDataFactory.swift
//  News
//
//  Created by Agnieszka Juraszek on 20/01/2023.
//

import Foundation

enum NewsViewDataFactory {
    static func create(from news: News) -> NewsViewData {
        return NewsViewData(
            title: news.title,
            imageURL: nil
        )
    }
}
