//
//  DetailView.swift
//  TestApp
//
//  Created by Hamam Nasrodin on 03/08/2026.
//

import SwiftUI
import os

struct DetailView: View {
  let film: Film?

  var body: some View {
    ZStack {
      ScrollView {
        VStack(spacing: 8, ) {
          VStack {
            AsyncImage(url: URL(string: film?.movie_banner ?? "")) {
              image in
              image.resizable().scaledToFit().frame(width: .infinity, height: 200).clipShape(
                RoundedRectangle(cornerRadius: 16))
            } placeholder: {
              ProgressView()
            }
          }.frame(maxWidth: .infinity)
          TitleDesc(title: film?.title, desc: nil)
          TitleDesc(title: "Original Title", desc: film?.original_title)
          TitleDesc(title: "Release Date", desc: film?.release_date)
          TitleDesc(title: "Director", desc: film?.director)
          TitleDesc(title: "Producer", desc: film?.producer)
          TitleDesc(title: "Rating Score", desc: film?.rt_score)
          TitleDesc(title: "Running Time in Minutes", desc: film?.running_time)
          TitleDesc(title: "Description", desc: film?.description)

        }
      }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top).padding(12)
    }
  }
}

#Preview {
  DetailView(film: MockFilmList[0])
}
