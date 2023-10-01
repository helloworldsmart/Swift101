//
//  FourTargetButtonView.swift
//  SwimmingStrokes
//
//  Created by Michael on 2023/10/1.
//

import SwiftUI

struct TargetButtonView: View {
    var iconName: String
    var tagNumber: Int
    
    var buttonSize: CGFloat {
        return (UIScreen.main.bounds.width - 60) / 2
    }
    
    var body: some View {
        Button(action: {
            // 在此處放置按鈕的動作
        }) {
            Image(systemName: iconName)
                .resizable()  // 使圖標可調整大小
                .frame(width: buttonSize - 80, height: buttonSize - 80)  // 設定按鈕的寬度和高度以保持正方形，減去左右各40像素的間距
                .padding(40)  // 為圖標增加40像素的間距
                .background(RoundedRectangle(cornerRadius: buttonSize / 4).fill(Color.blue)) // 等比例圓角
                .foregroundColor(.white)
        }
    }
}

struct FourTargetButtonView: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                TargetButtonView(iconName: "house", tagNumber: 1)
                TargetButtonView(iconName: "list.clipboard.fill", tagNumber: 2)
            }
            
            HStack(spacing: 20) {
                TargetButtonView(iconName: "map", tagNumber: 3)
                TargetButtonView(iconName: "gearshape", tagNumber: 4)
            }
        }
        .padding(.horizontal, 20)
    }
}

struct FourTargetButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FourTargetButtonView()
    }
}
