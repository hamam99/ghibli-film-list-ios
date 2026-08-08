//
//  ContentView.swift
//  TestApp
//
//  Created by Hamam Nasrodin on 03/08/2026.
//

import SwiftUI

struct ContentView: View {

    private let ghibliService = GhibliServices()

    @State private var listFilms: [Film] = []
    @State private var loading = true
    @State private var errorMessage: String? = nil

    @ViewBuilder
    private var BodyContent: some View {
        NavigationStack {
            if loading {
                ProgressView("Loading....")
            } else if errorMessage != nil {
                Text(errorMessage ?? "").font(.title2).foregroundColor(.red)
            } else {
                List(listFilms, id: \.id) { item in
                    NavigationLink(value: item) {
                        VStack {
                            AsyncImage(
                                url: URL(
                                    string: item.movie_banner
                                )
                            ) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 300, height: 160)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))

                            } placeholder: {
                                ProgressView()
                            }
                            Text(item.title).font(.title3.bold())
                        }.frame(maxWidth: .infinity)
                    }
                }
                .navigationDestination(for: Film.self) { data in
                    DetailView(film: data)
                }
                .navigationTitle("Ghibli Films")
            }
        }
    }

    var body: some View {
        ZStack {
            BodyContent
        }.task {
            await loadMovies()
        }

    }

    func loadMovies() async {
        loading = true

        do {
            let response = try await ghibliService.getMovies()
            listFilms = response
            loading = false
            errorMessage = nil
        } catch {
            loading = false
            errorMessage = error.localizedDescription
        }
    }
}

#Preview {
    ContentView()
}
