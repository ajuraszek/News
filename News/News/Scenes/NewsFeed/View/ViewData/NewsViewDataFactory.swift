//
//  NewsViewDataFactory.swift
//  News
//
//  Created by Agnieszka Juraszek on 20/01/2023.
//

import Foundation

enum NewsViewDataFactory {
    static func create(from news: News) -> NewsViewData {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        var dateText = ""
        let isoDateFormatter = ISO8601DateFormatter()
        if
            let date = news.date,
            let isoDate = isoDateFormatter.date(from: date) {
            dateText = dateFormatter.string(from: isoDate)
        }
        return NewsViewData(
            title: news.title,
            text: news.info,
            date: dateText,
            imageURL: news.imageUrl
        )
    }
}
