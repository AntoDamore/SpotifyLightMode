//
//  TabBar.swift
//  S
//
//  Created by Antonio D'amore on 13/12/21.
//

import Foundation
import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label{
                        Text("Play")
                    }
                icon: {
                 
                    Image("home-32")
                }}
            DisplayContent()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            ContentView()
                .tabItem {
                    Label{
                        Text("Your Library")} icon: {
                            Image("collection-32")
                        }
                }
        }
    }
    
}

