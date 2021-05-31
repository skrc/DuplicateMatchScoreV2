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
    @State var maxPlayers = 12
    var maxBoards = 2
    var rounds = 7
    var body: some View {
        
        VStack{
            HStack (alignment: .bottom) {
                        Text("Club Name")
                            .font(.title)
                            .multilineTextAlignment(.center)
                        Text(" Matchitem. date")
                            .font(.title)
                            .multilineTextAlignment(.center)
                            
                    }
                    HStack{
                        
                        Picker("Players", selection: $maxPlayers) {
                            Text("8, 2 Tables").tag(8)
                            Text("9, 2 Tables").tag(9)
                            Text("10, 2 Tables").tag(10)
                            Text("12, 3 Tables").tag(12)
                            Text("16, 4 tables").tag(16)
                        }
                        .pickerStyle(MenuPickerStyle())
                        Text("...: \(maxPlayers)")
                            .multilineTextAlignment(.trailing)
                    }
                    
                    Spacer()
        }
        
        

    }
}

struct Match_Previews: PreviewProvider {
    static var previews: some View {
        
        MatchListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
