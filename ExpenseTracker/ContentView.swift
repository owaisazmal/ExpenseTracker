//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Khan, Owais on 6/20/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationView{
                ScrollView{
                    VStack(alignment: .leading, spacing: 24) {
                        //Mark: Tiltle
                        Text("Overview")
                            .font(.title2)
                            .bold()
                    }
                    .padding()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                }
                .background(Color.Background)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    // Notification Icon
                    ToolbarItem{
                        Image(systemName: "bell.badge")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color.icon, .primary)
                    }
                }
            }
            .navigationViewStyle(.stack)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
        
    }
}
