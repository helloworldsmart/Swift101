/// Copyright (c) 2021 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct SignInView: View {
  @ObservedObject private var viewModel = SignInViewModel()

  var body: some View {
    NavigationView {
      VStack(spacing: 30) {
        NavigationLink(
          destination: RepositoriesView(displayed: $viewModel.isShowingRepositoriesView),
          isActive: $viewModel.isShowingRepositoriesView
        ) { EmptyView() }

        Image("rw-logo")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 300, height: 200, alignment: .center)

        if viewModel.isLoading {
          ProgressView()
        } else {
          Button(action: { viewModel.signInTapped() }, label: {
            Text("Sign In")
              .font(Font.system(size: 24).weight(.semibold))
              .foregroundColor(Color("rw-light"))
              .padding(.horizontal, 50)
              .padding(.vertical, 8)
          })
          .background(buttonBackground)
        }
      }
      .navigationBarHidden(true)
      .onAppear {
        viewModel.appeared()
      }
    }
  }

  private var buttonBackground: some View {
    RoundedRectangle(cornerRadius: 8)
      .fill(Color("rw-green"))
  }
}

struct SignInView_Previews: PreviewProvider {
  static var previews: some View {
    SignInView()
  }
}
