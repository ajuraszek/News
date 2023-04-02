//
//  NewsRowView.swift
//  News
//
//  Created by Agnieszka Juraszek on 20/01/2023.
//

import Foundation
import SwiftUI

struct NewsRowView: View {
    
    private enum Constants {
        static let imageSize: CGFloat = 48
        static let leadingTextPadding: CGFloat = 12
        static let textSpacing: CGFloat = 8
    }
    
    private let viewData: NewsViewData
    
    init(viewData: NewsViewData) {
        self.viewData = viewData
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewData.date)
                .font(.footnote)
                .foregroundColor(.gray)
            
            HStack(spacing: 16) {
                AsyncImage(
                    url: viewData.imageURL,
                    content: { content in
                        content.image?
                            .resizable()
                            .scaledToFill()
                    }
                )
                .frame(width: Constants.imageSize, height: Constants.imageSize, alignment: .center)
                .clipped()
                
                Text(viewData.title)
                    .bold()
                    .lineLimit(2)
            }
            .padding(.all, Constants.leadingTextPadding)
            Text(viewData.text)
                .lineLimit(3)
        }
    }
}
