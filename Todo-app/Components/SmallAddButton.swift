//
//  SmallAddButton.swift
//  Todo-app
//
//  Created by md imran on 30/12/22.
//

import SwiftUI

struct SmallAddButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 50)
                .foregroundColor(Color.green)
            
            Text("+")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color.white)
        }
        .frame(height: 50)
    }
}

struct SmallAddButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallAddButton()
    }
}
