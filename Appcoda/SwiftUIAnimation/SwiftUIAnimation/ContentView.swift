//
//  ContentView.swift
//  SwiftUIAnimation
//
//  Created by Michael on 2023/9/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        CircleDownloadIndicatorView()
        HeartView()
    }
}

struct CircleDownloadIndicatorView: View {

    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 14)
                .frame(width: 100, height: 100)
            
            Circle()
                .trim(from: 0, to: 0.2)
                .stroke(Color.green, lineWidth: 7)
                .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
    //            .animation(Animation.default.repeatForever(autoreverses: false))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                .onAppear() {
                    self.isLoading = true
                }
        }
    }
}

struct HeartView: View {
    @State private var circleColorChanged = false
    @State private var heartColorChanged = false
    @State private var heartSizeChanged = false


    var body: some View {

        ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(circleColorChanged ? Color(.systemGray5) : .red)
//                .animation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3))

            Image(systemName: "heart.fill")
                .foregroundColor(heartColorChanged ? .red : .white)
                .font(.system(size: 100))
                .animation(nil)
                .scaleEffect(heartSizeChanged ? 1.0 : 0.5)
//                .animation(.default)
        }
//        .animation(.default)
        .onTapGesture {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3)) {
                self.circleColorChanged.toggle()
                self.heartColorChanged.toggle()
            }
            self.heartSizeChanged.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
