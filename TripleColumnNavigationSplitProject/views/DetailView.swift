//
//  DetailView.swift
//  TripleColumnNavigationSplitProject
//
//  Created by Karin Prater on 13.11.22.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var navigationManager: NavigationStateManager
    
    var body: some View {
        
        if let category = navigationManager.selectedCategory {
            
            switch category {
                case .book:
                    if let book = navigationManager.selectedBook {
                        BookDetailView(book: book)
                    } else {
                        Text("Select a book")
                    }
                 
                case .song:
                    if let song = navigationManager.selectedSong {
                        SongDetailView(song: song)
                    } else  {
                        Text("Select a song")
                    }
                    
                case .movie:
                    if let movie = navigationManager.selectedMovie {
                        MovieDetailView(movie: movie)
                    } else {
                        Text("Select a movie")
                    }
            }
            
        } else {
            Text("Select something")
        }
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
            .environmentObject(NavigationStateManager())
    }
}
