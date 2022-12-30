//
//  TaskRow.swift
//  Todo-app
//
//  Created by md imran on 30/12/22.
//

import SwiftUI

struct TaskRow: View {
    
    var task: String
    var completed: Bool
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: completed ? "checkmark.circle": "circle")
            
            Text(task)
        }
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: "Laundry", completed: false)
    }
}
