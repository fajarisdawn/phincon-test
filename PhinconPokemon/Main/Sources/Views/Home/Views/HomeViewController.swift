//
//  HomeViewController.swift
//  PhinconPokemon
//
//  Created by fajaradiwasentosa on 22/06/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var myPokemonsButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    var footerView: PokemonFooterView?
    var viewModel: HomeViewModel!
    
    init(_ viewModel: HomeViewModel) {
        super.init(nibName: String(describing: HomeViewController.self), bundle: nil)
        self.viewModel = viewModel
        self.viewModel.interactor = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchAll()
        configureView()
    }
    
    private
    func configureView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(cellType: PokemonCell.self)
        self.collectionView.register(supplementaryViewType: PokemonFooterView.self, ofKind: UICollectionView.elementKindSectionFooter)
        self.myPokemonsButton.layer.cornerRadius = 5
        self.myPokemonsButton.addTarget(self, action: #selector(myPokemonButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc
    private
    func myPokemonButtonTapped(_ sender: UIButton) {
        let viewModel = MyPokemonViewModel()
        let viewController = MyPokemonViewController(viewModel)
        self.redirect(to: viewController)
    }
}
