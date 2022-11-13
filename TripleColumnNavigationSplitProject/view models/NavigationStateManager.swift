//
//  NavigationStateManager.swift
//  TripleColumnNavigationSplitProject
//
//  Created by Karin Prater on 13.11.22.
//

import SwiftUI
import Combine

class NavigationStateManager: ObservableObject {
    
    @Published var columnVisibility: NavigationSplitViewVisibility = .all
    
    @Published var selectedCategory: Category? = nil
    
    @Published var selectedSong: Song? = nil {
        didSet {
            selectedID = selectedSong?.id.uuidString
        }
    }
    
    @Published var selectedMovie: Movie? = nil{
        didSet {
            selectedID = selectedMovie?.id.uuidString
        }
    }
    
    @Published var selectedBook: Book? = nil{
        didSet {
            selectedID = selectedBook?.id.uuidString
        }
    }
    
    @Published var selectedID: String? = nil
    
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        
        /*
         // clear selection when category changes
         
        $selectedCategory.sink { [weak self] _ in
            self?.selectedSong = nil
            self?.selectedMovie = nil
            self?.selectedBook = nil
        }
        .store(in: &subscriptions)
         */
    }
    
    func goToSettings() {
        
    }
    
    func setSelectedBook(to book: Book) {
        
    }
    
    func setSelectedSong(to song: Song) {
       
    }
}
