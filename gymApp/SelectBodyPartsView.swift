//
//  SelectBodyPartsView.swift
//  gymApp
//
//  Created by Alex Leung on 2023-08-05.
//

import SwiftUI

struct SelectBodyPartsView: View {
    @State private var selectedPart = 0
    @State private var quantity: Int = 0
    @State private var isConfirmed = false
    @State private var selectedButtonString = ""
    @State private var selectedButtonActivityId = 0
    
    
    var body: some View {
        
        VStack{
            VStack{
                HStack{
                    Button("Chest"){
                        selectedPart = BodyPartModel.selectedBodyPart("chest")
                    }.padding(5)
                    Button("Back"){
                        selectedPart = BodyPartModel.selectedBodyPart("back")
                    }.padding(5)
                    Button("Arms"){
                        selectedPart = BodyPartModel.selectedBodyPart("arms")
                    }.padding(5)
                    Button("Shoulders"){
                        selectedPart = BodyPartModel.selectedBodyPart("shoulders")
                    }.padding(5)
                }
                HStack{
                    Button("Legs"){
                        selectedPart = BodyPartModel.selectedBodyPart("legs")
                    }.padding(5)
                    Button("Calves"){
                        selectedPart = BodyPartModel.selectedBodyPart("calves")
                    }.padding(5)
                    Button("Core"){
                        selectedPart = BodyPartModel.selectedBodyPart("core")
                    }.padding(5)
                    Button("Aerobic"){
                        selectedPart = BodyPartModel.selectedBodyPart("aerobic")
                    }.padding(5)
                }
            }.foregroundColor(.red)
            Spacer()
            VStack{
                VStack{
                    if isConfirmed == true{
                        Text("You have selected \(selectedButtonString), and will do it for \(quantity) times")
                    }
                    if selectedPart != 0 {
                        ScrollView {
                            VStack {
                                let activityDictionary = BodyPartModel.fetchActivitiesByParts(bodyPartNumber: selectedPart)
                                ForEach(Array(activityDictionary.sorted(by: { $0.key < $1.key })),id: \.key) { activityId, activityName in
                                    HStack {
                                        Button(action: {
                                            selectedButtonActivityId = activityId
                                            selectedButtonString = activityName
                                        }) {
                                            Text("Name:\(activityName)+ID:\(activityId)")
                                        }
                                        .padding(5)
                                        if selectedButtonActivityId == activityId {
                                            Stepper("\(quantity)", value: $quantity, in: 0...10, step: 1)
                                        }
                                    }
                                    Divider()
                                }
                            }
                            .background()
                            .padding(5)
                        }
                        }
                        
                }
                Spacer()
                VStack(){
                    Button("Confirm") {
                        selectedPart = 0
                        isConfirmed = true
                    }.foregroundColor(.red)
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
