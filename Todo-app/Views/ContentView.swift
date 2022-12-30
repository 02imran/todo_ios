//
//  ContentView.swift
//  Todo-app
//
//  Created by md imran on 30/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAddTaskView: Bool = false
    @StateObject var realmManager: RealmManager = RealmManager()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            TaskUiView()
                .environmentObject(realmManager)
            
            SmallAddButton()
                .padding()
                .onTapGesture {
                    showAddTaskView.toggle()
                }
        }
        .sheet(isPresented: $showAddTaskView, content: {
            AddTaskView()
                .environmentObject(realmManager)
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
