//
//  SelectBodyPartsView.swift
//  gymApp
//
//  Created by Alex Leung on 2023-08-05.
//

import SwiftUI

struct SelectBodyPartsView: View {
    @State private var selectedPart = ""
    let stringArray = showActivity()
    
    var body: some View {
        
        VStack{
            VStack{
                HStack{
                    Button("Chest"){
                        selectedPart = selectedBodyPaty("chest")
                    }.padding(5)
                    Button("Back"){
                        selectedPart = selectedBodyPaty("back")
                    }.padding(5)
                    Button("Arms"){
                        selectedPart = selectedBodyPaty("arms")
                    }.padding(5)
                    Button("Shoulders"){
                        selectedPart = selectedBodyPaty("shoulders")
                    }.padding(5)
                }
                HStack{
                    Button("Legs"){
                        selectedPart = selectedBodyPaty("legs")
                    }.padding(5)
                    Button("Calves"){
                        selectedPart = selectedBodyPaty("calves")
                    }.padding(5)
                    Button("Core"){
                        selectedPart = selectedBodyPaty("core")
                    }.padding(5)
                }
            }.foregroundColor(.red)
            Spacer()
            VStack{
                if selectedPart != "" {
                    VStack {
                        ForEach(DBHelper.fetchActivitiesByParts(bodyparts: selectedPart), id: \.self) { buttonText in
                            Button(action: {}) {
                                Text(buttonText)
                            }
                            .padding(5)
                            Divider()
                        }
                    }.background()
                        .padding(5)
                }
            }
        }
    }
}

struct SelectBodyPartsView_Previews: PreviewProvider {
    static var previews: some View {
        SelectBodyPartsView()
    }
}
