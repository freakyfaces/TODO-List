//
//  MainView.swift
//  TODOList
//
//  Created by Sepehr Harfi on 6/21/22.
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

struct MainView: View {
    @State var items: [TODOItem] = []
    
    var body: some View {
        TabView {
            ContentView(items: $items)
                .tabItem {
                    Label("All", systemImage: "list.dash")
                }
            FilteredView(items: $items)
                .tabItem{
                    Label("Ordered", systemImage: "square.and.pencil")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
