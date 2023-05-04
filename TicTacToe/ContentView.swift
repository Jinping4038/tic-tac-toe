//
//  ContentView.swift
//  TicTacToe
//
//  Created by king on 4/30/23.
//

import SwiftUI

struct ContentView: View {
    @State var board = [["","",""],
                        ["","",""],
                        ["","",""]]
    
    @State var xTurn: Bool = true
    @State var updateStatus = "Tic Tac Toe"
    
    var containerWidth: CGFloat = UIScreen.main.bounds.width - 32.0
    var body: some View {
        
        let buttonWidth = containerWidth * 0.3
        
        VStack(spacing: 0) {
            Spacer()
            Text(updateStatus)
                .foregroundColor(.blue)
                .font(.largeTitle)
            
            Spacer()
            
            HStack(spacing: 0) {
                CellView(action: {clickedButton(row: 0, col: 0)}, text: board[0][0])

                Rectangle()
                    .fill(.black)
                    .frame(width: buttonWidth * 0.1, height: buttonWidth)
                CellView(action: {clickedButton(row: 0, col: 1)}, text: board[0][1])
                
                Rectangle()
                    .fill(.black)
                    .frame(width: buttonWidth * 0.1, height: buttonWidth)
                
                CellView(action: {clickedButton(row: 0, col: 2)}, text: board[0][2])
            }
            
            Rectangle()
                .fill(.black)
                .frame(width: buttonWidth * 3, height: buttonWidth * 0.1)
            
            HStack(spacing: 0) {
                CellView(action: {clickedButton(row: 1, col: 0)}, text: board[1][0])
                
                Rectangle()
                    .fill(.black)
                    .frame(width: buttonWidth * 0.1, height: buttonWidth)
                
                CellView(action: {clickedButton(row: 1, col: 1)}, text: board[1][1])
                
                Rectangle()
                    .fill(.black)
                    .frame(width: buttonWidth * 0.1, height: buttonWidth)
                
                CellView(action: {clickedButton(row: 1, col: 2)}, text: board[1][2])
            }
            
            Rectangle()
                .fill(.black)
                .frame(width: buttonWidth * 3, height: buttonWidth * 0.1)
            
            HStack(spacing: 0) {
                CellView(action: {clickedButton(row: 2, col: 0)}, text: board[2][0])
                
                Rectangle()
                    .fill(.black)
                    .frame(width: buttonWidth * 0.1, height: buttonWidth)
                
                CellView(action: {clickedButton(row: 2, col: 1)}, text: board[2][1])
                
                Rectangle()
                    .fill(.black)
                    .frame(width: buttonWidth * 0.1, height: buttonWidth)
                
                CellView(action: {clickedButton(row: 2, col: 2)}, text: board[2][2])
            }
            
            Spacer()
            Button(action: {startOver()}, label: {
                    Text("Start again")
                    
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .frame(width: 300, height: 88)
                    .background(Color.blue)
                    .cornerRadius(50)
            })
        }
    }
    
    func startOver() {
        updateStatus = "Tic Tac Toe"
        board[0][0] = ""
        board[0][1] = ""
        board[0][2] = ""
        board[1][0] = ""
        board[1][1] = ""
        board[1][2] = ""
        board[2][0] = ""
        board[2][1] = ""
        board[2][2] = ""
    }
    
    func clickedButton(row: Int, col: Int)  {
        if board[row][col] != "" {
            return
        }
        
        if !checkWin() {
            if xTurn {
                board[row][col] = "X"
            } else {
                board[row][col] = "O"
            }
        }
        
        if checkWin() {
            updateStatus = "Win"
        } else if board[0][0] != "" &&
                  board[0][1] != "" &&
                  board[0][2] != "" &&
                  board[1][1] != "" &&
                  board[1][2] != "" &&
                  board[2][0] != "" &&
                  board[2][1] != "" &&
                  board[2][2] != "" {
                  updateStatus = "Draw"
        }
        
        xTurn = !xTurn
//        if xTurn {
//            xTurn = false
//        } else {
//            xTurn = true
//        }
    }
    
    func checkWin() -> Bool {
        for row in 0..<3 {
            if (board[row][0] != "") &&
                (board[row][0] == board[row][1]) &&
                (board[row][0] == board[row][2]) {
                return true
            }
        }

        for col in 0..<3 {
            if (board[0][col] != "") &&
                (board[0][col] == board[1][col]) &&
                (board[0][col] == board[2][col]) {
                return true
            }
        }

        if (board[0][0] != "") &&
            (board[0][0] == board[1][1]) &&
            (board[0][0] == board[2][2]) {
            return true
        }

        if (board[0][2] != "") &&
            (board[0][2] == board[1][1]) &&
            (board[0][2] == board[2][0]) {
            return true
        }
        return false
    }
}
   
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
