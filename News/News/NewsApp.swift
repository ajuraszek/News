//
//  NewsApp.swift
//  News
//
//  Created by Agnieszka Juraszek on 20/01/2023.
//

import SwiftUI

@main
struct NewsApp: App {
    var body: some Scene {
        WindowGroup {
            NewsFeedSceneFactory.create()
        }
    }
}
