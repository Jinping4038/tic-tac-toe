//
//  CellView.swift
//  TicTacToe
//
//  Created by king on 5/2/23.
//

import SwiftUI

struct CellView: View {

    var action: ()->()
    var text: String
    var containerWidth: CGFloat = UIScreen.main.bounds.width - 32.0
    var body: some View {
        let buttonWidth = containerWidth * 0.3
        
        
        Button(action: action) {
            Text(text)
                .font(.largeTitle)
                .frame(width: buttonWidth, height: buttonWidth)
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(action: {}, text: "0")
    }
}
