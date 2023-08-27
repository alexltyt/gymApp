//
//  Calendar.swift
//  gymApp
//
//  Created by Greg on 2023-08-15.
//


import SwiftUI

struct Calander: View {
    @State private var title: String = ""
    @State private var dueDate: Date = Date()

    var body: some View {
        VStack {
            Text("New Workout")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)

            Form {
                // Title
                TextField("Title", text: $title)
                    .textFieldStyle(DefaultTextFieldStyle())

                // Due date
                DatePicker("Enter your date", selection: $dueDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())

                // Button create
                Button("Create") {
                    // Implement your create logic here
                }
            }
        }
    }
}

struct Calander_Previews: PreviewProvider {
    static var previews: some View {
        Calander()
    }
}
