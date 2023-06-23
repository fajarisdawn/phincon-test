//
//  MyPokemonViewController.Extension.swift
//  PhinconPokemon
//
//  Created by fajaradiwasentosa on 23/06/23.
//

import Foundation
import UIKit

extension MyPokemonViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.pokemons.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MyPokemonTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(viewModel.pokemons[indexPath.item])
        cell.interactor = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
            (action, sourceView, completionHandler) in
            let object = self.viewModel.pokemons[indexPath.row]
            self.viewModel.delete(object)
            completionHandler(true)
        }
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        
        swipeConfiguration.performsFirstActionWithFullSwipe = false
        
        return swipeConfiguration
    }
}

extension MyPokemonViewController: InternalMyPokemonInteractor, MyPokemonTableViewCellInteractor {
    func successRename() {
        Toast.text(
            "Success rename pokemon",
            config: .init(direction: .bottom, autoHide: true, enablePanToClose: true, enteringAnimation: .default, exitingAnimation: .fade(alphaValue: 0), attachTo: self.view)
        ).show()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func successFetchData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func deleteData() {
        Toast.text(
            "Success remove pokemon",
            config: .init(direction: .bottom, autoHide: true, enablePanToClose: true, enteringAnimation: .default, exitingAnimation: .fade(alphaValue: 0), attachTo: self.view)
        ).show()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func rename(_ object: PokemonEntity) {
        self.viewModel.rename(object)
    }
    
}
