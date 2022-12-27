//
//  ContentView.swift
//  PackagesExample
//
//  Created by Michael on 2022/12/27.
//

import SwiftUI
// General modules
import MyViews
import MyModels
// Specific modules
import HelloButton
import ContentViewModel

struct ContentView: View {
  @ObservedObject var viewModel = MyModels.ContentViewModel()
  @ObservedObject var viewModel2 = ContentViewModel()
  
  var body: some View {
    VStack {
      HelloButton(action: viewModel.hello)
      Text("Hellos: \(viewModel.hellos)")
        .frame(maxWidth: .infinity, alignment: .center)
      MyViews.HelloButton {
        viewModel2.hello()
      }
      Text("Hellos: \(viewModel2.hellos)")
    }
  }
}
