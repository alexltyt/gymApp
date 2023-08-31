//
//  CalendarViewModel.swift
//  gymApp
//
//  Created by Greg on 2023-08-27.
//

import Foundation

class CalendarViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var dueDate: Date = Date()
    @Published var selectedDate: Date? // Added property for selected date
    
    func handleCreateButtonTapped() -> Date? { // Updated return type
        selectedDate = dueDate // Save the selected date
        return selectedDate
    }
}

