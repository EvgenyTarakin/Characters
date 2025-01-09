//
//  CharacterCell.swift
//  Characters
//
//  Created by Евгений Таракин on 10.01.2025.
//

import UIKit
import SnapKit
import Kingfisher

final class CharacterCell: UITableViewCell {
    
    // MARK: - property
    
    static let reuseIdentifier = String(describing: CharacterCell.self)
    
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

// MARK: - private func

private extension CharacterCell {
    func commonInit() {
        
    }
}

