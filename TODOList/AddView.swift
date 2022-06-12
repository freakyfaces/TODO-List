//
//  AddView.swift
//  TODOList
//
//  Created by Sepehr Harfi on 6/11/22.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var mode
    @Binding var items: [TODOItem]
    
    @State var description = ""
    @State var date = Date()
    
    @State var isDescriptionNullAlertPresented = false
    
    var body: some View {
        Form{
            TextField("Description", text: $description)
            DatePicker("Date", selection: $date)
        }
        .alert("No Description!", isPresented: $isDescriptionNullAlertPresented){
            Button("Cancel", role:.cancel){ }
        }
        .navigationTitle(Text("Add a New TODO"))
        .toolbar{
            Button{
                if description != ""{
                    let item = TODOItem(description: description, date: date)
                    items.append(item)
                    mode.wrappedValue.dismiss()
                }
                else{
                    isDescriptionNullAlertPresented = true
                }
                
            } label:{
                Text("Submit")
            }
            
        }
    }
}
