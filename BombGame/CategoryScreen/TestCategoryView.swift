//
//  TestCategoryView.swift
//  BombGame
//
//  Created by nikita on 11.02.25.
//

import SwiftUI

struct TestCategoryView: View {
    var body: some View {
        NavigationStack {
            NavigationLink(destination: CategoriesView()) {
                Text("CategoryView")
            }
        }
    }
}

#Preview {
    TestCategoryView()
}
