//
//  MatchView.swift
//  DuplicateMatchScore
//
//  Created by Sandra K Cureton on 5/26/21.
//

import SwiftUI
import CoreData

struct MatchView: View {
    @EnvironmentObject var model:Match
    var matchitem: Match
    var body: some View {
        
        HStack (alignment: .bottom){
            Text("Club Name")
                .font(.title)
                .multilineTextAlignment(.center)
            Text(" Matchitem. date")
                .font(.title)
                .multilineTextAlignment(.center)
                
        }
        Spacer()

    }
}

struct Match_Previews: PreviewProvider {
    static var previews: some View {
        
        MatchListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
