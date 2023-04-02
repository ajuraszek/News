//
//  NewsFeedView.swift
//  News
//
//  Created by Agnieszka Juraszek on 20/01/2023.
//

import SwiftUI

struct NewsFeedView: View {
    
    @StateObject var viewModel: NewsFeedViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach($viewModel.newsViewData) { $viewData in
                    NewsRowView(viewData: viewData)
                }
            }
            .navigationTitle("News")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct NewsFeedView_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeedSceneFactory.create()
    }
}
