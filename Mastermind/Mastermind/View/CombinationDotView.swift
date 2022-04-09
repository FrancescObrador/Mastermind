//
//  CombinationDotView.swift
//  Mastermind
//
//  Created by Francesc Miquel Obrador Artigues on 1/4/22.
//

import SwiftUI

struct CombinationDotView: View {
    @ObservedObject var viewModel: CombinationDotViewModel
    
    var body: some View {

        Circle()
            .strokeBorder(Color.black, lineWidth: viewModel.size.width * 0.05)
            .background(Circle().fill(viewModel.color))
            .frame(width: viewModel.size.width, height: viewModel.size.height)
    }
}

struct CombinationDotView_Previews: PreviewProvider {
    static var previews: some View {
        CombinationDotView(viewModel: CombinationDotViewModel(color: .green))
    }
}
