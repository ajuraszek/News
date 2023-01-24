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
            text: "Blablabla bla.",
            imageURL: URL(string: "https://cdn.pixabay.com/photo/2012/08/27/14/19/mountains-55067__340.png")
        )
    }
}
