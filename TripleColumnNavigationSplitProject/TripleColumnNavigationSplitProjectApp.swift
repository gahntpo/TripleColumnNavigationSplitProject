//
//  TripleColumnNavigationSplitProjectApp.swift
//  TripleColumnNavigationSplitProject
//
//  Created by Karin Prater on 13.11.22.
//

import SwiftUI

@main
struct TripleColumnNavigationSplitProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        #if os(OSX)
        Settings {
            SettingsView()
                .frame(minWidth: 300, maxWidth: .infinity,
                       minHeight: 300, maxHeight: .infinity)
        }
        #endif
    }
}
