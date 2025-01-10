//
//  MainViewController.swift
//  Characters
//
//  Created by Евгений Таракин on 10.01.2025.
//

import UIKit
import SnapKit
import Alamofire

final class MainViewController: UIViewController {
    
    // MARK: - private property
    
    private var characters: [Character] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(CharacterCell.self, forCellReuseIdentifier: CharacterCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    // MARK: - ViewController lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        loadData()
    }

}

// MARK: - private func

private extension MainViewController {
    func commonInit() {
        title = "Characters"
        
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.left.right.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
    
    func loadData() {
        AF.request("https://rickandmortyapi.com/api/character",
                   method: .get).responseDecodable(of: NetworkModel.self,
                                                       completionHandler: { [weak self] result in
                       guard let self else { return }
                       characters = result.value?.results ?? []
                       tableView.reloadData()
        })
    }
}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterCell.reuseIdentifier, for: indexPath) as? CharacterCell
        else { return UITableViewCell() }
        let character = characters[indexPath.row]
        cell.configurate(name: character.name,
                         icon: character.image,
                         species: character.species,
                         gender: character.gender,
                         location: character.location?.name,
                         status: character.status)
        
        return cell
    }
}

