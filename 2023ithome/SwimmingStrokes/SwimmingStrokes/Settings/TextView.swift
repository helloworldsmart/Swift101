//
//  TextView.swift
//  SwimmingStrokes
//
//  Created by Michael on 2023/10/10.
//

import SwiftUI

// Part 1
//struct CustomView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}

// Part 2
//struct CustomView: UIViewRepresentable {
//
//    func makeUIView(context: Context) -> some UIView {
//        // Return the UIView object
//    }
//
//    func updateUIView(_ uiView: some UIView, context: Context) {
//        // Update the view
//    }
//}

//
struct TextView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UITableView {
        // Return the UIView object
        return UITableView()
    }
    
    func updateUIView(_ uiView: UITableView, context: Context) {
        // Update the view
    }
    
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
