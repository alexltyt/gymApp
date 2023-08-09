//
//  SelectBodyPartsView.swift
//  gymApp
//
//  Created by Alex Leung on 2023-08-05.
//

import SwiftUI

struct SelectBodyPartsView: View {
    @State private var selectedPart = 0
    
    var body: some View {
        
        VStack{
            VStack{
                HStack{
                    Button("Chest"){
                        selectedPart = BodyPartModel.selectedBodyPaty("chest")
                    }.padding(5)
                    Button("Back"){
                        selectedPart = BodyPartModel.selectedBodyPaty("back")
                    }.padding(5)
                    Button("Arms"){
                        selectedPart = BodyPartModel.selectedBodyPaty("arms")
                    }.padding(5)
                    Button("Shoulders"){
                        selectedPart = BodyPartModel.selectedBodyPaty("shoulders")
                    }.padding(5)
                }
                HStack{
                    Button("Legs"){
                        selectedPart = BodyPartModel.selectedBodyPaty("legs")
                    }.padding(5)
                    Button("Calves"){
                        selectedPart = BodyPartModel.selectedBodyPaty("calves")
                    }.padding(5)
                    Button("Core"){
                        selectedPart = BodyPartModel.selectedBodyPaty("core")
                    }.padding(5)
                }
            }.foregroundColor(.red)
            Spacer()
            VStack{
                VStack{
                    if selectedPart != 0 {
                        VStack {
                            ForEach(BodyPartModel.fetchActivitiesByParts(bodyPartNumber: selectedPart), id: \.self) { buttonText in
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
                Spacer()
                VStack(){
                    
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
