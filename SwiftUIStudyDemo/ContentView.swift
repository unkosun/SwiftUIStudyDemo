//
//  ContentView.swift
//  SwitfUIStudyDemo
//
//  Created by peko on 2021/3/25.
//

import SwiftUI

struct ContentView: View {
    let scale: CGFloat = UIScreen.main.bounds.width / 414
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Text("0")
                .font(.system(size: 76))
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .trailing)
            CalculatorButtonPad().padding(.bottom)
        }
        .scaleEffect(scale)
    }
}

struct CalculatorButtonPad: View {
    let pad :[[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip), .command(.percent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
        [.digit(0), .dot, .op(.equal)]
    ]
    var body: some View {
        
        VStack(spacing: 8) {
            ForEach(pad, id:\.self) { row in
                CalculatorButtonRow(row: row)
            }
        }
    }
}


struct CalculatorButtonRow: View {
    let row :[CalculatorButtonItem]
    var body: some View {
        HStack {
            ForEach(row, id:\.self) { item in
                CalculatorButton(title: item.title, size: item.size, backgroundColorName: item.backgroundColorName) {
                    print("Button:\(item.title)")
                }
            }
        }
    }
}


struct CalculatorButton:View {
    let fontSize: CGFloat = 38
    let title: String
    let size: CGSize
    let backgroundColorName: String
    let action: () -> Void
    
    var body: some View {
        Button(action:action) {
            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(.white)
                .frame(width: size.width, height: size.height)
                .background(Color(backgroundColorName))
                .cornerRadius(size.height / 2)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
