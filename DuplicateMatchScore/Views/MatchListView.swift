//
//  ContentView.swift
//  DuplicateMatchScore
//
//  Created by Sandra K Cureton on 5/26/21.
//

import SwiftUI
import CoreData

struct MatchListView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Match.date, ascending: false)],
        animation: .default)
    
    private var items: FetchedResults<Match>
    @State var newMatch = ""
    var key = "Show"
    var body: some View {
        VStack {
        Image("logo").resizable()
            .aspectRatio(contentMode: .fit)
        
        NavigationView {
            List{
           // VStack {
                Section (header: Text("Add New Match")){
                   // Text("New item info will go here")
                HStack {
                   TextField("Enter Club Name ...", text: $newMatch )
                   Button(action: {
                        if !newMatch.isEmpty {
                            let newItem = Match(context: viewContext)
                            newItem.club = newMatch
                            newItem.date = Date()
                            do {
                                try viewContext.save()
                            } catch {
                                let nsError = error as NSError
                                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                            }
                            }
                    }, label: {Text("Save")})
                   }
                
                } // Section One Ends
                
                Section {
                    // For items...
                    ForEach(items) { item in
                        
                        NavigationLink(
                            destination: MatchView(matchitem: item),
                            label: {
                                //  Text("\(item.date!) formatter:itemFormatter")
                                Text("\(item.club!) ")
                                //     .lineLimit(1)
                            }
                        )
                        
                    } // End for Each items
                    .onDelete(perform: deleteItems(offsets:))
                    .navigationTitle("Match List")
                 //   .navigationBarItems(trailing: Button("New Match") {
                 //                           addItem()            })
                } //Section 2 ends
            }  //end VStack or List
            } // End Navigation View
          } //End VStack
   
        .toolbar {
            EditButton()

            Button(action: addItem) {
               Label("Add Item", systemImage: "plus") }
        } // End Body
        }
 //   }
   

    private func addItem() {
        withAnimation {
            let newItem = Match(context: viewContext)
            newItem.date = Date()
            newItem.club = "1st Thurs"
            

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .none
//    formatter.string(from: <#T##Date#>)
    
    return formatter
}()
// func string(from date: Date) -> String

struct MatchListView_Previews: PreviewProvider {
    static var previews: some View {
        MatchListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
