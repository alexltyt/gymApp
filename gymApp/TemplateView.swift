//
//  TemplateView.swift
//  gymApp
//
//  Created by Max HUI on 2023-08-21.
//

import SwiftUI

struct TemplateView: View {
    @ObservedObject private var viewModel = TemplateViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ForEach(viewModel.templates, id: \.self) { templateName in
                    HStack {
                        Text(templateName)
                        Spacer()
                        Button(action: {
                            viewModel.editTemplate(templateName: templateName)
                        }) {
                            Image(systemName: "pencil.circle.fill")
                        }
                        Button(action: {
                            viewModel.deleteTemplate(templateName: templateName)
                        }) {
                            Image(systemName: "trash.circle.fill")
                        }
                    }
                    
                    Spacer()
                }
                .navigationTitle("Template")
            }
            .toolbar {
                Button{
                    // add template function
                } label: {
                    Image(systemName: "plus")
                }
            }
            .onAppear {
                viewModel.fetchTemplates() // Fetch templates when the view appears
            }
        }
    }
    
    
    struct TemplateView_Previews: PreviewProvider {
        static var previews: some View {
            TemplateView()
        }
    }
}
