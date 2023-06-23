//
//  MyPokemonViewController.swift
//  PhinconPokemon
//
//  Created by fajaradiwasentosa on 23/06/23.
//

import UIKit

class MyPokemonViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel: MyPokemonViewModel!
    
    init(_ viewModel: MyPokemonViewModel) {
        super.init(nibName: String(describing: MyPokemonViewController.self), bundle: nil)
        self.viewModel = viewModel
        self.viewModel.interactor = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    
    private func configureView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(cellType: MyPokemonTableViewCell.self)
        navigationController?.navigationItem.title = "My Pokemons"
    }
    
}
