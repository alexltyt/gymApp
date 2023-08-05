//
//  ContentView.swift
//  gymApp
//
//  Created by Alex Leung on 2023-07-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ActivityView()
                .navigationBarTitle("Gym App")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
