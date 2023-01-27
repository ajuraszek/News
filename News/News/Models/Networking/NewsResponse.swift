//
//  NewsResponse.swift
//  News
//
//  Created by Agnieszka Juraszek on 27/01/2023.
//

import Foundation

struct NewsContainerResponse : Decodable {
    let results: [NewsResponse?]?
}

struct NewsResponse: Decodable {
    let title: String?
    let abstract: String?
    let publishedDate: Date?
    let multimedia: [Multimedia?]?
    
    struct Multimedia: Decodable {
        let url: URL?
    }
}
