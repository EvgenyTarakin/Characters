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
    
    // MARK: - private property
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.crop.circle")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private lazy var topStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, statusImageView])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 12
        
        return stackView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "test"
        label.textColor = .black
        label.font = .systemFont(ofSize: 21, weight: .medium)
        
        return label
    }()
    
    private lazy var statusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "unknown")
        
        return imageView
    }()
    
    private lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.text = "test"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        
        return label
    }()
    
    private lazy var playImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "whatch_episodes")
        
        return imageView
    }()
    
    private lazy var locationStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [locationImageView, locationLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 6
        
        locationImageView.snp.makeConstraints {
            $0.width.equalTo(12)
        }
        
        return stackView
    }()
    
    private lazy var locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pin")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.text = "test"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        
        return label
    }()
    
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

// MARK: - func

extension CharacterCell {
    func configurate(name: String, icon: URL,
                     species: String, gender: String,
                     location: String, status: String) {
        nameLabel.text = name
        iconImageView.kf.setImage(with: icon)
        genderLabel.text = species + ", " + gender
        locationLabel.text = location
        
        switch status {
        case "Alive": statusImageView.image  = UIImage(named: "alive")
        case "Dead": statusImageView.image  = UIImage(named: "dead")
        default: statusImageView.image  = UIImage(named: "unknown")
        }
    }
}

// MARK: - private func

private extension CharacterCell {
    func commonInit() {
        addSubview(iconImageView)
        addSubview(topStackView)
        addSubview(genderLabel)
        addSubview(playImageView)
        addSubview(locationStackView)
        
        iconImageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(16)
            $0.left.equalToSuperview().inset(24)
            $0.height.width.equalTo(120)
        }
        topStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.left.equalTo(iconImageView.snp.right).inset(-16)
            $0.right.equalToSuperview().inset(24)
            $0.height.equalTo(26)
        }
        genderLabel.snp.makeConstraints {
            $0.top.equalTo(topStackView.snp.bottom).inset(-4)
            $0.left.equalTo(iconImageView.snp.right).inset(-16)
            $0.right.equalToSuperview().inset(24)
        }
        playImageView.snp.makeConstraints {
            $0.top.equalTo(genderLabel.snp.bottom).inset(-12)
            $0.left.equalTo(iconImageView.snp.right).inset(-16)
            $0.height.equalTo(36)
            $0.width.equalTo(148)
        }
        locationStackView.snp.makeConstraints {
            $0.top.equalTo(playImageView.snp.bottom).inset(-10)
            $0.left.equalTo(iconImageView.snp.right).inset(-16)
            $0.right.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview().inset(16)
        }
    }
}

