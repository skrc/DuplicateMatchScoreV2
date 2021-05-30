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
    var key = "Show"
    var body: some View {
       
        NavigationView {
            List {  ForEach(items) { item in
            /*    NavigationLink(
                    key, destination: MatchView(matchitem: item))
              */
           NavigationLink(
            destination: MatchView(matchitem: item),
            label: {
                Text("\(item.date!) formatter:itemFormatter")
                .lineLimit(1)
                     }
                )
               
                         //   Text("\(item.club!)")
                        }
                        .onDelete(perform: deleteItems(offsets:))
                        
                    }
            .navigationTitle("Match List")
            .navigationBarItems(trailing: Button("New Match") {
                addItem()            }
            )
        }
        
        .toolbar {
            EditButton()

            Button(action: addItem) {
                Label("Add Item", systemImage: "plus")
            }
        }
    }
   

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
    
    return formatter
}()

struct MatchListView_Previews: PreviewProvider {
    static var previews: some View {
        MatchListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
