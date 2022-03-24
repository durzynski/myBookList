//
//  LabelStackView.swift
//  myBookList
//
//  Created by Damian Durzyński on 24/03/2022.
//

import Foundation
import UIKit

class CustomStackView: UIStackView {
   
    init(_axis: NSLayoutConstraint.Axis, _spacing: CGFloat, _alignment: UIStackView.Alignment? = .leading) {
        
        
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        spacing = _spacing
        axis = _axis
        alignment = _alignment ?? .leading
        
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
}
