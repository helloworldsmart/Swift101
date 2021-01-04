/// Copyright (c) 2019 Razeware LLC
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
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
  @IBOutlet private var searchCityName: UITextField!
  @IBOutlet private var tempLabel: UILabel!
  @IBOutlet private var humidityLabel: UILabel!
  @IBOutlet private var iconLabel: UILabel!
  @IBOutlet private var cityNameLabel: UILabel!
  
  // MARK: 5.
  private let bag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    style()
    // Do any additional setup after loading the view, typically from a nib.
    // MARK: 4.
    ApiController.shared.currentWeather(city: "RxSwift")
      .observeOn(MainScheduler.instance)
      .subscribe(onNext: { data in
        self.tempLabel.text = "\(data.temperature)º C"
        self.iconLabel.text = data.icon
        self.humidityLabel.text = "\(data.humidity)%"
        self.cityNameLabel.text = data.cityName
      })
      .disposed(by: bag)
    // MARK: 6.
    // MARK: 7. orEmpty !
//    searchCityName.rx.text.orEmpty
//      .filter { !$0.isEmpty }
//      .flatMap { text in
//        return ApiController.shared.currentWeather(city: text)
//          .catchErrorJustReturn(ApiController.Weather.empty)
//    }
    
    // MARK: 9. Using binding observables to display data
    let search = searchCityName.rx.text.orEmpty
      .filter { !$0.isEmpty }
      .flatMapLatest { text in
        return ApiController.shared.currentWeather(city: text)
          .catchErrorJustReturn(ApiController.Weather.empty)
      }
      .share(replay: 1)
      .observeOn(MainScheduler.asyncInstance)
    
    search.map { "\($0.temperature)º C" }
      .bind(to: tempLabel.rx.text)
      .disposed(by: bag)

    search.map { $0.icon }
      .bind(to: iconLabel.rx.text)
      .disposed(by: bag)
    
    search.map { "\($0.humidity)%" }
      .bind(to: humidityLabel.rx.text)
      .disposed(by: bag)
    
    search.map { $0.cityName }
      .bind(to: cityNameLabel.rx.text)
      .disposed(by: bag)
    
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()

    Appearance.applyBottomLine(to: searchCityName)
  }

  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  // MARK: - Style

  private func style() {
    view.backgroundColor = UIColor.aztec
    searchCityName.textColor = UIColor.ufoGreen
    tempLabel.textColor = UIColor.cream
    humidityLabel.textColor = UIColor.cream
    iconLabel.textColor = UIColor.cream
    cityNameLabel.textColor = UIColor.cream
  }
}
