//
//  Duplicate Match Scoring App
//  MatchTabView
//
//  Created by Christopher Ching on 2021-02-03.
//

import SwiftUI
import CoreData

var matchitem = Match()

struct MatchTabView: View {
    
    @State var tabIndex = 1

    
    var body: some View {
        
        TabView (selection: $tabIndex ) {
            MatchListView()
                            .tabItem {
                                VStack {
                                    Image(systemName: "list.bullet")
                                    Text("List")
                                }
                            }
                            .tag(1)
            MatchView(matchitem: matchitem)
                            .tabItem {
                                VStack {
                                    Image(systemName: "doc.plaintext.fill")
                                    Text("Match")
                                }
                            }
                            .tag(2)
            
            ScoreView()
                .tabItem {
                    VStack {
                        Image(systemName: "pencil")
                        Text("Enter Scores")
                    }
                }
                .tag(3)
            
            ResultsView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Results")
                    }
                }
                .tag(4)
        }
        .environmentObject(Match())
        
    }
}

struct MatchTabView_Previews: PreviewProvider {
    static var previews: some View {
        MatchTabView()
    }
}
