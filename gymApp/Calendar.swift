//
//  Calendar.swift
//  gymApp
//
//  Created by Greg on 2023-08-15.
//


import SwiftUI

struct CalendarView: View {
    @StateObject private var viewModel = CalendarViewModel()

    var body: some View {
        VStack {
            Text("New Workout")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)

            Form {
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())

                // Due date
                DatePicker("Enter your date", selection: $viewModel.dueDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())

                // Button create
                Button("Create") {
                    viewModel.handleCreateButtonTapped()
                }
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
