//
//  ContentView.swift
//  TODOList
//
//  Created by Sepehr Harfi on 6/11/22.
//
import SwiftUI

class TODOItem{
    var total_num: Int = 0
    var id = Int()
    var description = ""
    var data = Date()
    init(description: String, data: Date){
        self.description = description
        self.data = data
        self.id = total_num
        total_num = total_num + 1
    }
    
    func get_total_num() -> String{
            return String(total_num)
        }
}

struct ContentView: View {
    @State var items: [TODOItem] = [
        TODOItem(description: "Database Homework", data: Date())
             ]
    
    func deleteItem(at offsets: IndexSet){
        items.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView{
            List{
                //Text("Total TODOs: \(TODOItem.get_total_num())")
                //    .bold()
                //    .font(.title2)
                ForEach(items, id: \.id){ item in
                    Text(item.description)
                        .bold()
                        .font(.title3)
                }
                .onDelete(perform: deleteItem)
            }
            .navigationTitle("TODO List")
            .toolbar{
                NavigationLink {
                    AddView(items: $items)
                } label: {
                    Text("Add")
                    
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
