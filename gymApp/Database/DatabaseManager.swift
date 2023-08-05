import SQLite


//
//class DatabaseManager {
//    static let shared = DatabaseManager()
//
//    private lazy var db: Connection = {
//        do {
//            return try Connection("gym-app.sqlite")
//        } catch {
//            fatalError("Error opening database: \(error)")
//        }
//    }()
//
//    func fetchActivity() throws -> [Activity] {
//        let activity = Table("activity")
//        let id = Expression<Int64>("activity_id")
//        let name = Expression<String?>("activity_name")
//
//        var activities: [Activity] = []
//
//        for user in try db.prepare(activity) {
//            let activity = Activity(id: user[id], name: user[name] ?? "N/A")
//            activities.append(activity)
//        }
//
//        return activities
//    }
//}
