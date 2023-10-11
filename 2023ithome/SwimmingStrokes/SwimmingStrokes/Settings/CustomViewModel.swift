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
}

// MARK: - Interface Methods
extension CustomViewModel {
    func updateTitleAction(title: String) {
        delegate?.updateTitle(title: title)
    }
}
