////
////  DBManagerSQLite.swift
////  gymApp
////
////  Created by Alex Leung on 2023-08-04.
////
//
//import SQLite
//import Foundation
//
//
//class DatabaseManager {
//    // SQLite database connection
//    private var db: Connection?
//    
//    class DatabaseManager {
//        // SQLite database connection
//        private var db: Connection?
//        
//        init() {
//            let dbPath = FileManager.default.currentDirectoryPath
//            // Set up the database connection
//            //if let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
//            if (true){
//            do {
//                    db = try Connection("\(dbPath)/gym-app.sqlite")
//                    print("Database connection established.")
//                } catch {
//                    print("Error connecting to the database: \(error)")
//                }
//            } else {
//                //print("Database path not found.")
//            }
//        }
//    }
//}
//
//    extension DatabaseManager {
//        // MARK: - Activity CRUD
//        
//        func createActivity(activityName: String) throws {
//            let activity = Table("activity")
//            let activityNameColumn = Expression<String>("activity_name")
//            
//            let insert = activity.insert(activityNameColumn <- activityName)
//            do {
//                try db?.run(insert)
//            } catch {
//                throw error
//            }
//        }
//        
//        func getAllActivities() throws -> [String] {
//            let activity = Table("activity")
//            let activityNameColumn = Expression<String>("activity_name")
//            
//            var activities: [String] = []
//            
//            do {
//                for row in try db!.prepare(activity.select(activityNameColumn)) {
//                    activities.append(row[activityNameColumn])
//                }
//            } catch {
//                throw error
//            }
//            
//            return activities
//        }
//        
//        func updateActivity(activityId: Int, newActivityName: String) throws {
//            let activity = Table("activity")
//            let activityIdColumn = Expression<Int>("activity_id")
//            let activityNameColumn = Expression<String>("activity_name")
//            
//            let targetActivity = activity.filter(activityIdColumn == activityId)
//            let update = targetActivity.update(activityNameColumn <- newActivityName)
//            
//            do {
//                if try db!.run(update) == 0 {
//                    throw SQLiteError.NotFound
//                }
//            } catch {
//                throw error
//            }
//        }
//        
//        func deleteActivity(activityId: Int) throws {
//            let activity = Table("activity")
//            let activityIdColumn = Expression<Int>("activity_id")
//            
//            let targetActivity = activity.filter(activityIdColumn == activityId)
//            let delete = targetActivity.delete()
//            
//            do {
//                if try db!.run(delete) == 0 {
//                    throw SQLiteError.NotFound
//                }
//            } catch {
//                throw error
//            }
//        }
//    }
//
//
