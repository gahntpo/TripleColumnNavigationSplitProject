//
//  ContentView.swift
//  TripleColumnNavigationSplitProject
//
//  Created by Karin Prater on 13.11.22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var dataManager = ModelDataManager()
    @StateObject var navigationStateManager = NavigationStateManager()
    
    @SceneStorage("selectedCategory") var selectedCategoryString: String?
    @SceneStorage("selectedBook") var selectedBookId: String?
    
    var body: some View {
      
        NavigationSplitView(columnVisibility: $navigationStateManager.columnVisibility,
                            sidebar: {
            SidebarView()
                .navigationSplitViewColumnWidth(200)
        }, content: {
            MiddleSidebarView()
                .navigationSplitViewColumnWidth(min: 100, ideal: 250, max: 500)
        }, detail: {
            DetailView()
        })
       // .navigationSplitViewStyle(.balanced)
       // .navigationSplitViewStyle(.prominentDetail)
        
        .environmentObject(dataManager)
        .environmentObject(navigationStateManager)
        
        .onAppear {
            // restore state during launch
            
            guard let selectedCategoryString = selectedCategoryString else  { return }
            navigationStateManager.selectedCategory = Category(rawValue: selectedCategoryString)
            
            guard let id = selectedBookId,
                  let uuid = UUID(uuidString: id) else { return }
            
            if let selectBook = dataManager.books.first(where: { $0.id == uuid }) {
                navigationStateManager.selectedBook = selectBook
            }
            
        }
        
        .onReceive(navigationStateManager.$selectedCategory.dropFirst()) { newCategory in
            selectedCategoryString = newCategory?.rawValue
        }
        .onReceive(navigationStateManager.$selectedBook.dropFirst()) { newBook in
            // saving new state to user defaults
            selectedBookId = newBook?.id.uuidString
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
