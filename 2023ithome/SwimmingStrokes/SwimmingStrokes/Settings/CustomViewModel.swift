//
//  CustomViewModel.swift
//  SwimmingStrokes
//
//  Created by Michael on 2023/10/11.
//

import Foundation

protocol CustomViewModelDelegate: AnyObject {
    func updateTitle(title: String)
}

class CustomViewModel {
    weak var delegate: CustomViewModelDelegate?
    
    var isViewVisibleChanged: (() -> Void)?

    var isViewVisible: Bool = false {
        didSet {
            isViewVisibleChanged?()
        }
    }
}

// MARK: - Interface Methods
extension CustomViewModel {
    func updateTitleAction(title: String) {
        delegate?.updateTitle(title: title)
    }
}

// MARK: - Private Methods
extension CustomViewModel {
    func change() {
        DispatchQueue.main.async {
            self.isViewVisible = true
        }
    }
}
