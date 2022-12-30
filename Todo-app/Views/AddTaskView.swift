//
//  AddTaskView.swift
//  Todo-app
//
//  Created by md imran on 30/12/22.
//

import SwiftUI

struct AddTaskView: View {
    
    @State var title: String = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var realmanager: RealmManager
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Create a new task")
                .font(.title).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Enter Something", text: $title)
                .textFieldStyle(.roundedBorder)
            
            Button(action: {
                if title != "" {
                    realmanager.addTask(taskTitle: title)
                }
                dismiss()
            }, label: {
                Text("Add Task")
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(30)
            })
            
            Spacer()
        }
        .padding(.top, 40)
        .padding(.horizontal)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(RealmManager())
    }
}
