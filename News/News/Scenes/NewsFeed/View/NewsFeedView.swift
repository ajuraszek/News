//
//  NewsFeedView.swift
//  News
//
//  Created by Agnieszka Juraszek on 20/01/2023.
//

import SwiftUI

struct NewsFeedView: View {
    
    let news: [News] = [
        .init(title: "breaking news 1"),
        .init(title: "breaking news 2"),
        .init(title: "breaking news 3"),
        .init(title: "breaking news 4")
    ]
    
    var newsViewData: [NewsViewData] {
        news.map { NewsViewDataFactory.create(from: $0) }
    }
    
    var body: some View {
        List(newsViewData) { viewData in
            NewsRowView(viewData: viewData)
        }
    }
}

struct NewsFeedView_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeedView()
    }
}
