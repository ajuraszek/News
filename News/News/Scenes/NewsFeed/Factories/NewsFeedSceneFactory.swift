//
//  NewsFeedSceneFactory.swift
//  News
//
//  Created by Agnieszka Juraszek on 27/01/2023.
//

import Foundation

enum NewsFeedSceneFactory {
    static func create() -> NewsFeedView {
        let viewModel = NewsFeedViewModel()
        return NewsFeedView(viewModel: viewModel)
    }
}
