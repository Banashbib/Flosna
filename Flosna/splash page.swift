//
//  splash page.swift
//  Flosna
//
//  Created by Rahaf on 12/10/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct splash_page: View {
    var body: some View {
        WebImage(url: URL(string: "https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExZjQ3dGU0dHM3cDQ0azZvdzM3ZG5jY3BoeXV6czV5YTRrZ2prdXpqMiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/QJGZJt6XHN14cjp7G3/giphy.gif"))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
    }
}
struct splash_page_Previews: PreviewProvider {
    static var previews: some View {
        splash_page()
    }
}

