//
//  ContentView.swift
//  TODOList
//
//  Created by Sepehr Harfi on 6/11/22.
//
import SwiftUI

struct ContentView: View {
    @Binding var items: [TODOItem]
    @State private var showingSheet = false
    @State var selectedOrder = "Ascending";
    var orders = ["Ascending", "Descending", "Alphabetical"]
    
    
    func deleteItem(at offsets: IndexSet){
        items.remove(atOffsets: offsets)
    }
    func sort(){
        if selectedOrder == "Ascending"{
            self.items = self.items.sorted(by: { $0.date < $1.date })
        }
        if selectedOrder == "Descending"{
            self.items = self.items.sorted(by: { $0.date > $1.date })
        }
        else{
            self.items = self.items.sorted(by: { $0.description < $1.description })
        }
    }
    var body: some View {
        NavigationView{
                List{
                    Text("Total TODOs: \(items.count)")
                        .bold()
                        .font(.title2)
                    ForEach(items, id: \.id){ item in
                        VStack(alignment: .leading, spacing:10){
                            Text(item.description)
                                .bold()
                                .font(.title3)
                            Text("\(item.date)")
                        }
                    }
                    .onDelete(perform: deleteItem)
                }
            .navigationTitle("TODOs")
            .toolbar{
                HStack(){
                    Menu(content: {
                        Picker("Destination", selection: $selectedOrder) {
                            ForEach(orders, id: \.self) {
                                Text($0)
                            }
                        }
                    },
                         label: { Label ("Destination", systemImage: "text.justify") }
                    )
                    Button("Sort", action:sort)
                    NavigationLink {
                        AddView(items: $items)
                    } label: {
                        Text("+")
                            .bold()
                            .font(.title)
                        
                    }
                }
            }
            NavigationLink(destination: FilteredView(items: $items)){
                
            }
        }
    }
}
