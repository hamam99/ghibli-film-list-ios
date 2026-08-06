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
    VStack(spacing: 8, ) {
      VStack {
        AsyncImage(url: URL(string: film.movie_banner)) {
          image in
          image.resizable().scaledToFit().frame(width: 300, height: 160).clipShape(
            RoundedRectangle(cornerRadius: 16))
        } placeholder: {
          ProgressView()
        }
      }.frame(maxWidth: .infinity)

      VStack {
        Text(film.title).font(.title3.bold())
      }
      VStack {
        Text("Original Title:").font(.title3.bold())
        Text(film.original_title)
      }
      VStack {
        Text("Description").font(.title3.bold())
        Text(film.description)
      }
    }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top).padding(12)
  }
}
#Preview {
  DetailView(film: MockData)
}
