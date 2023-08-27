//
//  TemplateViewModel.swift
//  gymApp
//
//  Created by Max HUI on 2023-08-21.
//

import Foundation
import SQLite3

class TemplateViewModel: ObservableObject {
    @Published var templates: [String] = []
    
    func fetchTemplates() {
        guard let db = DBHelper.getDatabasePointer(databaseName: "gym-app.sqlite") else {
            print("Error: Database pointer is nil.")
            return
        }
        
        let query = "SELECT template_name FROM template;"
        
        var statement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            while sqlite3_step(statement) == SQLITE_ROW {
                if let templateName = sqlite3_column_text(statement, 0) {
                    let name = String(cString: templateName)
                    templates.append(name)
                }
            }
            sqlite3_finalize(statement)
        } else {
            print("Error: Failed to prepare the query.")
        }
        
        sqlite3_close(db)
    }
    
    func editTemplate(templateName: String) {
        
    }
    
    func deleteTemplate(templateName: String) {
        
    }
    
    
}

