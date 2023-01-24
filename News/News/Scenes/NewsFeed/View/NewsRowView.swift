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
        HStack {
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
            .padding([.leading, .top, .bottom], Constants.leadingTextPadding)
            
            VStack(alignment: .leading, spacing: Constants.textSpacing) {
                Text("Let's read: \(viewData.title)")
                    .bold()
                Text(viewData.text)
            }
            .padding(.all, Constants.leadingTextPadding)
        }
    }
}
