//
//  HomeViewController.Extension.swift
//  PhinconPokemon
//
//  Created by fajaradiwasentosa on 23/06/23.
//

import Foundation
import UIKit

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = viewModel.pokemonsTemp?.results.count else { return 0 }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let object = self.viewModel.pokemonsTemp else { return UICollectionViewCell() }
        let cell = collectionView.dequeueReusableCell(for: indexPath) as PokemonCell
        cell.configure(object.results[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 4 * 2) / 3
        return CGSize(width: width, height: width * 1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionFooter {
            let view: PokemonFooterView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, for: indexPath, viewType: PokemonFooterView.self)
            self.view.backgroundColor = .clear
            self.footerView = view
            return view
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 62)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let threshold = 100.0 ;
        let contentOffset = scrollView.contentOffset.y;
        let contentHeight = scrollView.contentSize.height;
        let diffHeight = contentHeight - contentOffset;
        let frameHeight = scrollView.bounds.size.height;
        var triggerThreshold = Float((diffHeight - frameHeight))/Float(threshold);
        triggerThreshold = min(triggerThreshold, 0.0)
        let pullRatio = min(abs(triggerThreshold),1.0);
        if pullRatio >= 0.8 {
            self.footerView?.animateFinal()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset.y;
        let contentHeight = scrollView.contentSize.height;
        let diffHeight = contentHeight - contentOffset;
        let frameHeight = scrollView.bounds.size.height;
        let pullHeight = abs(diffHeight - frameHeight);
        if pullHeight >= 0.0 {
            guard let footerView = self.footerView, footerView.isAnimating else { return }
            if let result = viewModel.pokemonsTemp?.results.count, let totalResult = viewModel.pokemonsTemp?.count {
                if result < totalResult {
                    self.viewModel.loadMore()
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let objects = viewModel.pokemonsTemp?.results else { return }
        let viewModel = PokemonViewModel.init(objects[indexPath.item])
        let viewController = PokemonViewController(viewModel)
        redirect(to: viewController)
    }
}

extension HomeViewController: ViewModelInteractor {
    func success(_ network: NetworkAPI) {
        DispatchQueue.main.async {
            self.footerView?.isAnimating = false
            self.collectionView.reloadData()
        }
    }
    
    func failed(_ message: String) {
        print(message)
    }
}
