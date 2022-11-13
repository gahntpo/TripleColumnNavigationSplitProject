//
//  MovieDetailView.swift
//  NavigationStackProject
//
//  Created by Karin Prater on 12.11.22.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        VStack {
            Text("Movie detail movie")
            Text(movie.title)
                .font(.title)
            
        }
        .navigationTitle(movie.title)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie(title: "Avatar"))
    }
}
