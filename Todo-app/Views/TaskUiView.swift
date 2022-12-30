//
//  TaskUiView.swift
//  Todo-app
//
//  Created by md imran on 30/12/22.
//

import SwiftUI

struct TaskUiView: View {
    
    @EnvironmentObject var realmanager: RealmManager
    
    var body: some View {
        VStack {
            Text("My Task")
                .font(.title3).bold()
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            List {
                ForEach(realmanager.tasks,id: \.id, content: { task in
                    if !task.isInvalidated {
                        TaskRow(task: task.title, completed: task.completed)
                            .onTapGesture {
                                realmanager.updateTask(id: task.id, completed: !task.completed)
                            }
                            .swipeActions(edge: .trailing , content: {
                                Button( role: .destructive, action: {
                                    realmanager.deleteTask(id: task.id)
                                }, label: {
                                    Label("Delete", systemImage: "trash")
                                })
                            })
                    }
                })
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    }
}

struct TaskUiView_Previews: PreviewProvider {
    static var previews: some View {
        TaskUiView()
            .environmentObject(RealmManager())
    }
}
