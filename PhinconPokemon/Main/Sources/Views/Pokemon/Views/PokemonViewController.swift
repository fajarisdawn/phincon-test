//
//  PokemonViewController.swift
//  PhinconPokemon
//
//  Created by fajaradiwasentosa on 23/06/23.
//

import UIKit
import SkeletonView


class PokemonViewController: UIViewController {

    @IBOutlet weak var catchButton: UIButton!
    @IBOutlet weak var abilityTableView: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    var viewModel: PokemonViewModel!
    
    init(_ viewModel: PokemonViewModel) {
        super.init(nibName: String(describing: PokemonViewController.self), bundle: nil)
        self.viewModel = viewModel
        self.viewModel.interactor = self
        self.viewModel.internalInteractor = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.get()
    }
    
    private
    func configureView() {
        catchButton.layer.cornerRadius = 5
        catchButton.addTarget(self, action: #selector(catchButtonTapped(_:)), for: .touchUpInside)
        catchButton.setTitle("CATCH", for: .normal)
        abilityTableView.dataSource = self
        abilityTableView.delegate = self
        abilityTableView.register(cellType: PokemonTableViewCell.self)
        abilityTableView.tableFooterView = UIView()
        guard let object = viewModel.pokemonResultEntity else { return }
        nameLabel.text = object.name.capitalized
        pokemonImageView.loadImage(url: URL(string: object.getoriginalImage()))
    }
    
    @objc
    private
    func catchButtonTapped(_ sender: UIButton) {
        self.alertWithTextField(title: "Add To My Pokemon", message: "", placeholder: "Nickname") { (nickname) in
            self.viewModel.savePokemon(nickname)
        }
    }
    
}

extension PokemonViewController: ViewModelInteractor, PokemonViewModelInteractor {
    
    func successSave() {
        Toast.text(
            "Success add to My Pokemon",
            config: .init(direction: .bottom, autoHide: true, enablePanToClose: true, enteringAnimation: .default, exitingAnimation: .fade(alphaValue: 0), attachTo: self.view)
        ).show()
    }
    func success(_ network: NetworkAPI) {
        DispatchQueue.main.async { [weak self] in
            guard let `self` = self else { return }
            self.configureView()
        }
        
    }
    
    func failed(_ message: String) {
        
    }
}
