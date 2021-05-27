//
//  MatchView.swift
//  DuplicateMatchScore
//
//  Created by Sandra K Cureton on 5/26/21.
//

import SwiftUI

struct MatchView: View {
    var matchitem: Match
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Match_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
