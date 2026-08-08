//
//  ContentView.swift
//  TestApp
//
//  Created by Hamam Nasrodin on 03/08/2026.
//

import SwiftUI

// struct Film: Identifiable, Hashable {
//     var id: String
//     var title: String
//     var original_title: String
//     var original_title_romanised: String
//     var image: String
//     var movie_banner: String
//     var description: String
//     var director: String
//     var producer: String
//     var release_date: String
//     var running_time: String
//     var url: String
// }

let MockData = Film(
    id: "86e544fd-79de-4e04-be62-5be67d8dd92e",
    title: "Nausicaä of the Valley of the Wind",
    original_title: "風の谷のナウシカ",
    original_title_romanised: "Kaze no Tani no Naushika",
    image: "https://www.themoviedb.org/t/p/original/tcrkfB8SRPQCgwI88hQScua6nxh.jpg",
    movie_banner: "https://www.themoviedb.org/t/p/original/ulVUa2MvnJAjAeRt7h23FFJVRKH.jpg",
    description:
        "Warrior and pacifist Princess Nausicaä desperately struggles to prevent two warring nations from destroying themselves and their dying planet.",
    director: "Hayao Miyazaki",
    producer: "Isao Takahata",
    release_date: "1984",
    running_time: "117",
    url: "https://ghibliapi.dev/films/86e544fd-79de-4e04-be62-5be67d8dd92e")

let MockDataArr: [Film] = [
    Film(
        id: "86e544fd-79de-4e04-be62-5be67d8dd92e",
        title: "Nausicaä of the Valley of the Wind",
        original_title: "風の谷のナウシカ",
        original_title_romanised: "Kaze no Tani no Naushika",
        image: "https://www.themoviedb.org/t/p/original/tcrkfB8SRPQCgwI88hQScua6nxh.jpg",
        movie_banner: "https://www.themoviedb.org/t/p/original/ulVUa2MvnJAjAeRt7h23FFJVRKH.jpg",
        description:
            "Warrior and pacifist Princess Nausicaä desperately struggles to prevent two warring nations from destroying themselves and their dying planet.",
        director: "Hayao Miyazaki",
        producer: "Isao Takahata",
        release_date: "1984",
        running_time: "117",
        url: "https://ghibliapi.dev/films/86e544fd-79de-4e04-be62-5be67d8dd92e"),
    Film(
        id: "86e544fd-79de-4e04-be62-5be67d8dd92eXXXX",
        title: "Nausicaä of the Valley of the Wind",
        original_title: "風の谷のナウシカ",
        original_title_romanised: "Kaze no Tani no Naushika",
        image: "https://www.themoviedb.org/t/p/original/tcrkfB8SRPQCgwI88hQScua6nxh.jpg",
        movie_banner: "https://www.themoviedb.org/t/p/original/ulVUa2MvnJAjAeRt7h23FFJVRKH.jpg",
        description:
            "Warrior and pacifist Princess Nausicaä desperately struggles to prevent two warring nations from destroying themselves and their dying planet.",
        director: "Hayao Miyazaki",
        producer: "Isao Takahata",
        release_date: "1984",
        running_time: "117",
        url: "https://ghibliapi.dev/films/86e544fd-79de-4e04-be62-5be67d8dd92e"),

]

struct ContentView: View {

    private let ghibliService = GhibliServices()

    @State private var listFilms: [Film] = []
    var body: some View {
        ZStack {
            NavigationStack {
                List(listFilms, id: \.id) { item in
                    (NavigationLink(value: item) {
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
                    })
                }
                .navigationDestination(for: Film.self) { data in
                    DetailView(film: data)
                }
                .navigationTitle("Ghibli Films")
            }
        }.task {
            do {
                let films = try await ghibliService.getMovies()
                NSLog("list films : \(films)")
                listFilms = films

            } catch {}
        }
    }
}
