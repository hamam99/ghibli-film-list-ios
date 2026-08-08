import Alamofire
import Foundation

struct Film: Identifiable, Hashable, Decodable {
    var id: String
    var title: String
    var original_title: String
    var original_title_romanised: String
    var image: String
    var movie_banner: String
    var description: String
    var director: String
    var producer: String
    var release_date: String
    var running_time: String
    var url: String
}

struct GhibliServices {
    let BASE_URL = "https://ghibliapi.vercel.app"

    func getMovies() async throws -> [Film] {
        do {
            let data = try await AF.request("\(BASE_URL)/films")
                .cacheResponse(using: .cache)
                .validate()
                .serializingData()
                .value
            // return try JSONDecoder().decode([Film].self, from: data)
            let decodeResponse = try JSONDecoder().decode([Film].self, from: data)
            return decodeResponse
        } catch {
            return []
        }
    }
}
