//
//  MiddleSidebarView.swift
//  TripleColumnNavigationSplitProject
//
//  Created by Karin Prater on 13.11.22.
//

import SwiftUI

struct MiddleSidebarView: View {
    
    @EnvironmentObject var dataManager: ModelDataManager
    @EnvironmentObject var navigationManager: NavigationStateManager
    
    var body: some View {
        
        if let category = navigationManager.selectedCategory {
            
            switch category {
                case .book:
                    List(dataManager.books,
                         selection: $navigationManager.selectedBook) { book in
                        Text(book.title)
                            .tag(book)
                    }
                    .navigationTitle("Books")
                    
                case .song:
                    List(dataManager.songs,
                         selection: $navigationManager.selectedSong) { song in
                        Text(song.title)
                            .tag(song)
                    }
                    .navigationTitle("Songs")
                    
                case .movie:
                    List(dataManager.movies,
                         selection: $navigationManager.selectedMovie) { movie in
                        Text(movie.title)
                            .tag(movie)
                    }
                    .navigationTitle("Movies")
        
            }
            
        } else {
            Text("Select a category")
        }
    }
}

struct MiddleSidebarView_Previews: PreviewProvider {
    static var previews: some View {
        MiddleSidebarView()
            .environmentObject(NavigationStateManager())
            .environmentObject(ModelDataManager())
    }
}
