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
