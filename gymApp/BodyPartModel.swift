//
//  BodyPartsModel.swift
//  gymApp
//
//  Created by Alex Leung on 2023-08-05.
//

import Foundation
import SQLite3

class BodyPartModel{
    static func fetchActivitiesByParts(bodyPartNumber:Int) -> [Int:String] {
        // Get the database pointer.
        guard let db = DBHelper.getDatabasePointer(databaseName: "gym-app.sqlite") else {
            print("Error: Database pointer is nil.")
            return [:]
        }
        
        let bodyPartNumber = bodyPartNumber
        //var selectedActivities: [String] = []
        var activityDictionary = [Int:String]()
        let query = "SELECT * FROM activity WHERE activity_id LIKE '\(bodyPartNumber)%';"
        //let query = "SELECT * FROM activity;"
        var statement: OpaquePointer?
        
        // Prepare the SQL query for execution.
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            // Execute the prepared statement and iterate through the result rows.
            while sqlite3_step(statement) == SQLITE_ROW {
                // Get the activity ID and name from the current row.
                let activityIdInt32 = sqlite3_column_int(statement, 0)
                let activityId = Int(activityIdInt32)
                let activityNamePointer = sqlite3_column_text(statement, 1)
                let activityName = activityNamePointer != nil ? String(cString: activityNamePointer!) : "N/A"
                
                //selectedActivities.append(activityName)
                activityDictionary[activityId] = activityName
            }
            
//            let sortedKeys = activityDictionary.keys.sorted()
//            for key in sortedKeys {
//                if let activityName = activityDictionary[key] {
//                    print("Activity ID: \(key), Activity Name: \(activityName)")
//                }
//            }

            // Finalize the statement after use.
            sqlite3_finalize(statement)
        } else {
            print("Error: Failed to prepare the query.")
        }

        // Close the database connection.
        sqlite3_close(db)
        //return selectedActivities
        return activityDictionary
    }
    
    //get all activities
    static func fetchAllActivities() {
        // Get the database pointer.
        guard let db = DBHelper.getDatabasePointer(databaseName: "gym-app.sqlite") else {
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
    
    static func selectedBodyPart(_ bodyparts: String) -> Int{
        
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
        case "aerobic":
            bodyPartNumber = 8
        default:
            print("Unexpected body part: \(bodyparts)")
            return 0
        }
        
        return bodyPartNumber
    }
    
}



