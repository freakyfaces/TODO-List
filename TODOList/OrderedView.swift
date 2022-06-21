//
//  ContentView.swift
//  TODOList
//
//  Created by Sepehr Harfi on 6/21/22.
//
import SwiftUI

struct OrderedView: View {
    @Binding var items: [TODOItem]
    @State private var showingSheet = false
    @State var date = Date()
    @State var showedItems: [TODOItem] = []
    
    func deleteItem(at offsets: IndexSet){
        items.remove(atOffsets: offsets)
    }
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM"
        return formatter.string(from: date)
    }
    var body: some View {
        NavigationView{
            List{
                ForEach(items, id: \.id){ item in
                    Group{
                        if formatDate(date: item.date) == formatDate(date: date){
                            VStack(alignment: .leading, spacing:10){
                                Text(item.description)
                                    .bold()
                                    .font(.title3)
                                Text("\(item.date)")
                            }
                        }
                    }
                }
                .onDelete(perform: deleteItem)
            }
            .navigationTitle("Ordered TODOs")
            .toolbar{
                Button("Pick a Date"){
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    DatePicker("Enter your date", selection: $date, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .font(.title)
                    .padding()
                    Button("Submit"){
                        showingSheet.toggle()
                    }
                }
            }
        }
    }
}
