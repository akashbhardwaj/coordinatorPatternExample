//
//  FirstDetailView.swift
//  CoordinatorExample
//
//  Created by Akash Bhardwaj on 13/02/23.
//

import SwiftUI

struct FirstDetailView: View {
    @ObservedObject var viewModel: FirstDetailViewModel
    
    var body: some View {
        VStack {
            Text("First Detail")
            TextField("name", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}

struct FirstDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FirstDetailView(viewModel: FirstDetailViewModel())
    }
}
