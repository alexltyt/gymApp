//
//  DBHandler.swift
//  gymApp
//
//  Created by Alex Leung on 2023-08-03.
//

import Foundation
import SQLite3

class DBHelper {
    // Function to get a pointer to the SQLite database.
    // If the database file does not exist in the document directory, it is copied from the main bundle.
    // Returns the pointer to the database or nil if an error occurs.
    static func getDatabasePointer(databaseName: String) -> OpaquePointer? {
        
        var databasePointer: OpaquePointer?
        
        // Get the path to the SQLite database in the document directory.
        let documentDatabasePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(databaseName).path
        
        // Check if the database already exists in the document directory.
        if FileManager.default.fileExists(atPath: documentDatabasePath){
            print("Database Exists (already)!")
        } else {
            // If the database does not exist, copy it from the main bundle to the document directory.
            guard let bundleDatabasePath = Bundle.main.resourceURL?.appendingPathComponent(databaseName).path
            else{
                print("Unwrapping Error:Bundle Database Path doesn't exist")
                return nil
            }
            do {
                try FileManager.default.copyItem(atPath: bundleDatabasePath, toPath: documentDatabasePath)
                print("Database created (copied)")
            } catch {
                print("Error: \(error.localizedDescription)")
                return nil
            }
        }
        
        // Open the database using the obtained path and store the pointer in `databasePointer`.
        if sqlite3_open(documentDatabasePath, &databasePointer) == SQLITE_OK {
            print("Successfully open database")
            print("Database path:\(documentDatabasePath)")
        } else {
            print("Could not open database")
        }
        
        return databasePointer
    }
    
    // Function to fetch all activities from the "activity" table in the SQLite database.
    static func fetchAllActivities() {
        // Get the database pointer.
        guard let db = getDatabasePointer(databaseName: "gym-app.sqlite") else {
            print("Error: Database pointer is nil.")
            return
        }
  
        // SQL query to select all rows from the "activity" table.
        let query = "SELECT * FROM activity;"

        var statement: OpaquePointer?
        // Prepare the SQL query for execution.
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            // Execute the prepared statement and iterate through the result rows.
            while sqlite3_step(statement) == SQLITE_ROW {
                // Get the activity ID and name from the current row.
                let activityId = sqlite3_column_int(statement, 0)
                if let activityName = sqlite3_column_text(statement, 1) {
                    let name = String(cString: activityName)
                    print("Activity ID: \(activityId), Name: \(name)")
                }
            }
            // Finalize the statement after use.
            sqlite3_finalize(statement)
        } else {
            print("Error: Failed to prepare the query.")
        }

        // Close the database connection.
        sqlite3_close(db)
    }
    
    static func fetchActivitiesByParts(bodyparts: String) -> [String] {
        // Get the database pointer.
        guard let db = getDatabasePointer(databaseName: "gym-app.sqlite") else {
            print("Error: Database pointer is nil.")
            return []
        }
        
        var bodyPartNumber = 0
        switch bodyparts {
        case "chest":
            bodyPartNumber = 1
        case "back":
            bodyPartNumber = 2
        case "arms":
            bodyPartNumber = 3
        case "shoulders":
            bodyPartNumber = 4
        case "legs":
            bodyPartNumber = 5
        case "calves":
            bodyPartNumber = 6
        case "core":
            bodyPartNumber = 7
        default:
            print("Unexpected body part: \(bodyparts)")
            return []
        }
        
        var selectedActivities: [String] = []
        let query = "SELECT * FROM activity WHERE activity_id LIKE '\(bodyPartNumber)%';"
        var statement: OpaquePointer?
        
        // Prepare the SQL query for execution.
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            // Execute the prepared statement and iterate through the result rows.
            while sqlite3_step(statement) == SQLITE_ROW {
                // Get the activity ID and name from the current row.
                let activityId = sqlite3_column_int(statement, 0)
                if let activityName = sqlite3_column_text(statement, 1) {
                    let name = String(cString: activityName)
                    selectedActivities.append(name)
                }
            }
            // Finalize the statement after use.
            sqlite3_finalize(statement)
        } else {
            print("Error: Failed to prepare the query.")
        }

        // Close the database connection.
        sqlite3_close(db)
        return selectedActivities
    }

//    var databasePointer: OpaquePointer?
//
//    func testDBExists2() {
//        if let dbPointer = DBHelper.getDatabasePointer(databaseName: "gym-app.sqlite") {
//            databasePointer = dbPointer
//        } else {
//            print("Oh my god. Stopped at testDBExists2 func.")
//        }
//    }
}
