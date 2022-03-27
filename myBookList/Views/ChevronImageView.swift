//
//  ChevronImageView.swift
//  myBookList
//
//  Created by Damian Durzyński on 24/03/2022.
//

import Foundation
import UIKit

class ChevronImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        tintColor = .secondaryLabel
        image = UIImage(systemName: K.chevronImageName)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
