//
//  Template.swift
//  gymApp
//
//  Created by Alex Leung on 2023-08-03.
//

import SwiftUI
import Foundation

struct ActivityView: View {
    @State private var firstActivity: String = ""
    var body: some View {

        VStack {
            Text("Testing DB exisit or not:")
            Button("Fetch Activity") {
                BodyPartModel.fetchAllActivities()
            }
        }
            
    }



}
