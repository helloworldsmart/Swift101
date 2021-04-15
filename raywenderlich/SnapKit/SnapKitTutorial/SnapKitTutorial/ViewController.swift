//
//  ViewController.swift
//  SnapKitTutorial
//
//  Created by Michael on 2021/4/15.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    // part1
//    let testView = UIView()
//    testView.backgroundColor = .cyan
//    view.addSubview(testView)
//    testView.snp.makeConstraints { (make) in
////      make.width.equalTo(100)
////      make.height.equalTo(100)
//      make.width.height.equalTo(100)
//      make.center.equalTo(view)
//    }
    
    // part2
//    let view1 = UIView()
//    view1.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
//    view1.center = view.center
//    view1.backgroundColor = .black
//    view.addSubview(view1)
//
//    let view2 = UIView()
//    view2.backgroundColor = .magenta
//    view1.addSubview(view2)
//    view2.snp.makeConstraints { (make) in
////      make.top.equalToSuperview().offset(20) // Superview 是父視圖
////      make.left.equalToSuperview().offset(20)
////      make.bottom.equalToSuperview().offset(-20) // bottom 要用負數
////      make.right.equalToSuperview().offset(-20)
//      make.edges.equalToSuperview().inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
//    }
    
    // part3
//    let view1 = UIView()
//    view1.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
//    view1.center = view.center
//    view1.backgroundColor = .black
//    view.addSubview(view1)
//
//    let view2 = UIView()
//    view2.backgroundColor = .magenta
//    view1.addSubview(view2)
//    view2.snp.makeConstraints { (make) in
//      make.top.equalTo(view1.snp.bottom).offset(10)
//      make.width.height.equalTo(100)
//      make.centerX.lessThanOrEqualTo(view1.snp.leading)
//    }
    
    // part4
//    let view1 = UIView()
//    view1.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
//    view1.center = view.center
//    view1.backgroundColor = .black
//    view.addSubview(view1)
//
//    let view2 = UIView()
//    view2.backgroundColor = .magenta
//    view1.addSubview(view2)
//    view2.snp.makeConstraints { (make) in
//      make.top.equalTo(view1.snp.bottom).offset(10)
//      make.width.height.equalTo(100)
////      make.left.greaterThanOrEqualTo(view1)
//      make.left.greaterThanOrEqualTo(view1.snp.left)
//    }
    
    // part5
//    let view1 = UIView()
//    view1.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
//    view1.center = view.center
//    view1.backgroundColor = .black
//    view.addSubview(view1)
//
//    let view2 = UIView()
//    view2.backgroundColor = .magenta
//    view1.addSubview(view2)
//    view2.snp.makeConstraints { (make) in
//      // if lessThanOrEqualTo and greaterThanOrEqualTo 同時並存, 優先權依照誰先寫, 誰是第一行
//      make.width.lessThanOrEqualTo(300)
//      make.width.greaterThanOrEqualTo(200)
//      make.height.equalTo(100)
//      make.center.equalToSuperview()
//    }
    
    // part6
//    let view1 = UIView()
//    view1.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
//    view1.center = view.center
//    view1.backgroundColor = .black
//    view.addSubview(view1)
//
//    let view2 = UIView()
//    view2.backgroundColor = .magenta
//    view1.addSubview(view2)
//    view2.snp.makeConstraints { (make) in
////      make.left.lessThanOrEqualTo(20)
//      // 以下三招都一樣
////      make.left.equalToSuperview().offset(10)
////      make.left.equalTo(10)
//      make.left.equalTo(view1.snp.left).offset(10)
//      // -----
//      make.right.equalTo(-40)
////      make.height.equalTo(100)
//      // 以下三招都一樣
////      make.width.height.equalTo(100)
//
////      make.width.equalTo(100)
////      make.height.equalTo(100)
//      make.size.equalTo(CGSize(width: 100, height: 100))
//
//      // -----
//      make.center.equalToSuperview()
//    }
    
    // part7
    let view1 = UIView()
    view1.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
    view1.center = view.center
    view1.backgroundColor = .black
    view.addSubview(view1)

    let view2 = UIView()
    view2.backgroundColor = .magenta
    view1.addSubview(view2)
    view2.snp.makeConstraints { (make) in
      make.width.equalTo(100).priority(999)
      make.width.equalTo(250).priority(666) // priority 看誰優先權的大就用誰的優先權, 超過1000就 Crash!
      make.height.equalTo(111)
      make.center.equalToSuperview()
    }
    
  }
}

