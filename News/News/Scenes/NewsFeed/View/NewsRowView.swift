//
//  NewsRowView.swift
//  News
//
//  Created by Agnieszka Juraszek on 20/01/2023.
//

import Foundation
import SwiftUI

struct NewsRowView: View {
    var viewData: NewsViewData

    var body: some View {
        Text("Let's read: \(viewData.title)")
    }
}
