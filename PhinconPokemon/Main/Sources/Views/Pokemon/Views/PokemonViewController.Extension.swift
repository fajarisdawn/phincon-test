//
//  PokemonViewController.Extension.swift
//  PhinconPokemon
//
//  Created by fajaradiwasentosa on 23/06/23.
//

import Foundation
import UIKit

extension PokemonViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.pokemon?.abilities.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let objects = self.viewModel.pokemon?.abilities else { return UITableViewCell() }
        let cell: PokemonTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(objects[indexPath.item])
        return cell
    }
}

extension PokemonViewController {
    func alertWithTextField(title: String? = nil, message: String? = nil, placeholder: String? = nil, completion: @escaping ((String) -> Void) = { _ in }) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField() { newTextField in
            newTextField.placeholder = placeholder
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in completion("") })
        alert.addAction(UIAlertAction(title: "Add To My Pokemon", style: .default) { action in
            if
                let textFields = alert.textFields,
                let tf = textFields.first,
                let result = tf.text
            { completion(result) }
            else
            { completion("") }
        })
        navigationController?.present(alert, animated: true)
    }
}
