//
//  Category.swift
//  TripleColumnNavigationSplitProject
//
//  Created by Karin Prater on 13.11.22.
//

import Foundation

enum Category: String, Hashable, CaseIterable, Identifiable {
    case book
    case song
    case movie
    
    var id: String {
        return self.rawValue
    }
    
    func title() -> String {
        switch self {
            case .book:
                return "Book"
            case .song:
                return "Song"
            case .movie:
                return "Movie"
        }
    }
}
