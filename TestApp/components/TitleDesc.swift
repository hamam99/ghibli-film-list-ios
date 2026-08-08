import SwiftUI
import os

struct TitleDesc: View {
    let title: String?
    let desc: String?

    var body: some View {
        VStack {
            Text(title ?? "").font(.title3.bold())
            if let text = desc {
                Text(text)
            }
        }
    }
}
