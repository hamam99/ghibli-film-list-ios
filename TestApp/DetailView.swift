//
//  DetailView.swift
//  TestApp
//
//  Created by Hamam Nasrodin on 03/08/2026.
//

import SwiftUI

struct DetailView: View {
    let film: Film

    var body: some View {
        Text("Title: \(film.title)")
    }
}
#Preview {
    DetailView(film: MockData)
}
