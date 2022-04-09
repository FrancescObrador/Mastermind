//
//  ResultDotView.swift
//  Mastermind
//
//  Created by Francesc Miquel Obrador Artigues on 1/4/22.
//

import SwiftUI

struct ResultDotView: View {
    @ObservedObject var viewModel: ResultDotViewModel
    
    var body: some View {

        Circle()
            .strokeBorder(Color.black, lineWidth: viewModel.size.width * 0.1)
            .background(Circle().fill(viewModel.color))
            .frame(width: viewModel.size.width, height: viewModel.size.height)
            
    }
}

struct ResultDotView_Previews: PreviewProvider {
    static var previews: some View {
        ResultDotView(viewModel: ResultDotViewModel(result: .positioned))
    }
}
