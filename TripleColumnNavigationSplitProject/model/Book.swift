//
//  Book.swift
//  NavigationStackProject
//
//  Created by Karin Prater on 12.11.22.
//

import Foundation

struct Book: Identifiable, Hashable, Codable {
    
    var title: String
    let id: UUID
    
    init(title: String, id: UUID = UUID()) {
        self.title = title
        self.id = id
    }
    
    static func examples() -> [Book] {
        [Book(title: "Lord of the Rings",
              id: UUID(uuidString:"81AB29CC-5403-4888-90F6-4663321494D4") ?? UUID()),
         Book(title: "Game of Thrones",
              id: UUID(uuidString:"81AB29CC-5403-4888-90F6-4663321494D8") ?? UUID()),
         Book(title: "The Shining",
              id: UUID(uuidString:"81AB29CC-5403-4888-90F6-4663321494D9") ?? UUID())]
    }
}
