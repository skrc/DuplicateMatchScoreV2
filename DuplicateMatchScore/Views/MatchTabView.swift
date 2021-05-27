//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by Christopher Ching on 2021-02-03.
//

import SwiftUI
import CoreData

var matchitem = Match()

struct MatchTabView: View {
    var body: some View {
        
        TabView {
            
            ResultsView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Results")
                    }
                }
            
            ScoreView()
                .tabItem {
                    VStack {
                        Image(systemName: "pencil")
                        Text("Enter Scores")
                    }
                }
            MatchView(matchitem: matchitem)
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
        }
        .environmentObject(Match())
        
    }
}

struct MatchTabView_Previews: PreviewProvider {
    static var previews: some View {
        MatchTabView()
    }
}
