//
//  FlexButton.swift
//  SwimmingStrokes
//
//  Created by Michael on 2023/9/26.
//

import SwiftUI

struct FlexButton: View {
    #if DEBUG
    let screenSize = UIScreen.main.bounds.size

    var body: some View {
        Button(action: {
            LibsManager.shared.showFlex()
        }) {
            Text("F")
                .frame(width: 50, height: 50)
                .background(Color.orange)
                .foregroundColor(.white)
                .clipShape(Circle())
                .padding(.all, 10)
        }
        .position(x: screenSize.width - 35, y: screenSize.height - 75)
    }
    #else
    var body: some View {
        EmptyView()
    }
    #endif
}

struct FlexButton_Previews: PreviewProvider {
    static var previews: some View {
        FlexButton()
    }
}
