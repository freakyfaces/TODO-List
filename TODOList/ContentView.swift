//
//  ContentView.swift
//  TODOList
//
//  Created by Sepehr Harfi on 6/11/22.
//
import SwiftUI

class TODOItem{
    public static var total_num = 0
    var id = Int()
    var description = ""
    var date = Date()
    
    init(description: String, date: Date){
        self.description = description
        self.date = date
        self.id = TODOItem.total_num
        TODOItem.total_num = TODOItem.total_num + 1
    }
    
}

struct ContentView: View {
    @State var items: [TODOItem] = []
    
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
            .navigationTitle("TODO List")
            .toolbar{
                NavigationLink {
                    AddView(items: $items)
                } label: {
                    Text("+")
                        .bold()
                        .font(.title)
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
