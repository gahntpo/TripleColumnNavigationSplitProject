//
//  SidebarView.swift
//  TripleColumnNavigationSplitProject
//
//  Created by Karin Prater on 13.11.22.
//

import SwiftUI

struct SidebarView: View {
    
    @EnvironmentObject var navigationManager: NavigationStateManager
    
    @State private var showSettings = false
    
    var body: some View {
        
        List(selection: $navigationManager.selectedCategory) {
            
            ForEach(Category.allCases) { category in
                
                NavigationLink(category.title(), value: category)
               // Text(category.title())
               //     .tag(category)
            }
            
        }
        #if os(iOS)
        .toolbar(content: {
            ToolbarItem(placement: .navigation) {
                Button {
                    showSettings.toggle()
                } label: {
                    Image(systemName: "gear")
                }
            }
        })
        .sheet(isPresented: $showSettings, content: {
            SettingsView()
        })
        #endif
        
        .navigationTitle("Categories")
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
