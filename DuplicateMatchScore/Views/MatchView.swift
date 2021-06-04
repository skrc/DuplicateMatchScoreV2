//
//  MatchView.swift
//  DuplicateMatchScore
//
//  Created by Sandra K Cureton on 5/26/21.
//

import SwiftUI
import CoreData

struct MatchView: View {
    @Environment(\.managedObjectContext) private var viewContext
    var matchitem: Match
    @State var maxPlayers = 12
    @State var maxBoards = 2
    var rounds = 7
    
    var body: some View {
        VStack{
            HStack (alignment: .bottom) {
                //  Text("\(matchitem.club!)")
                Text("Club")
                    .multilineTextAlignment(.trailing)
                    .font(.headline)
                //  Text("\(matchitem.date!)")
                Text(" Playing")
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                
            }
          //  .padding(.top, -55.0)
            HStack{
                
                Picker("Players", selection: $maxPlayers) {
                    Text("8, 2 Tables").tag(8)
                    Text("9, 2 Tables").tag(9)
                    Text("10, 2 Tables").tag(10)
                    Text("12, 3 Tables").tag(12)
                    Text("16, 4 tables").tag(16)
                }
                .pickerStyle(MenuPickerStyle())
                Text("... \(maxPlayers)")
                    .multilineTextAlignment(.trailing)
                    .padding(+13)
            }
          //  .padding(.top, -55.0)
            HStack{
                
                Picker("Boards Per Round", selection: $maxBoards) {
                    Text("2").tag(2)
                    Text("3").tag(3)
                    Text("4").tag(4)
                    
                    
                }
                .pickerStyle(MenuPickerStyle())
                Text("... \(maxBoards)")
                    .multilineTextAlignment(.trailing)
            }
         //   .padding(.top, -55.0)
            List{
                Section (header: Text("Table 1")){
                    HStack {
                        Text("N")
                        Text("12")
                        Text("Sandy")
                    }
                    HStack {
                        Text("S")
                        Text("1")
                        Text("Rosalie")
                    }
                    HStack {
                        Text("E")
                        Text("5")
                        Text("Doris")
                    }
                    HStack {
                        Text("W")
                        Text("10")
                        Text("Charla")
                    }
                    
                }
                Section (header: Text("Table 2")){
                    HStack {
                        Text("N")
                        Text("7")
                        Text("Adrienne")
                    }
                    HStack {
                        Text("S")
                        Text("11")
                        Text("Wendy")
                    }
                    HStack {
                        Text("E")
                        Text("8")
                        Text("Carol")
                    }
                    HStack {
                        Text("W")
                        Text("9")
                        Text("Mary")
                    }
                }
                Section (header: Text("Table 3")){
                    HStack {
                        Text("N")
                        Text("2")
                        Text("Jannel")
                    }
                    HStack {
                        Text("S")
                        Text("4")
                        Text("Carolyn")
                    }
                    HStack {
                        Text("Janine")
                        Text("3")
                        Text("Doris")
                    }
                    HStack {
                        Text("W")
                        Text("6")
                        Text("Roxie")
                    }
                }
                Section (header: Text("Table 4")) {
                    HStack {
                        Text("N")
                        Text("13")
                        Text(" ")
                    }
                    HStack {
                        Text("S")
                        Text("14")
                        Text(" ")
                    }
                    HStack {
                        Text("E")
                        Text("15")
                        Text(" ")
                    }
                    HStack {
                        Text("W")
                        Text("16")
                        Text(" ")
                    }
                }
        }
     //   Spacer()
    }
        .padding(.top, -55.0)
}
}

struct Match_Previews: PreviewProvider {
    static var previews: some View {
        
        MatchListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
