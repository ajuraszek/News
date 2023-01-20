//
//  NewsViewData.swift
//  News
//
//  Created by Agnieszka Juraszek on 20/01/2023.
//

import Foundation

struct NewsViewData: Identifiable {
    let id = UUID()
    let title: String
    let imageURL: URL?
}
