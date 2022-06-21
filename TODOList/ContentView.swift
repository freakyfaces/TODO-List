//
//  ContentView.swift
//  TODOList
//
//  Created by Sepehr Harfi on 6/11/22.
//
import SwiftUI

struct ContentView: View {
    @Binding var items: [TODOItem]
    
    func deleteItem(at offsets: IndexSet){
        items.remove(atOffsets: offsets)
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
                NavigationLink {
                    AddView(items: $items)
                } label: {
                    Text("+")
                        .bold()
                        .font(.title)
                    
                }
            }
            NavigationLink(destination: OrderedView(items: $items)){
                
            }
        }
    }
}
