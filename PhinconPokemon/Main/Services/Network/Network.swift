//
//  NetworkAPI.swift
//  PhinconPokemon
//
//  Created by fajaradiwasentosa on 22/06/23.
//

import Foundation

import Foundation

protocol NetworkInteractor {
    func success(_ object: Codable, network: NetworkAPI)
    func failed(_ message: String, network: NetworkAPI)
}

class Network {
    var interactor: NetworkInteractor?
    var dataTask: URLSessionDataTask?
    
    func task<T: Codable>(network: NetworkAPI, type: T.Type, method: HTTPMethod) {
        if let `dataTask` = dataTask {
            if dataTask.state != .running {
                request(network, type: type, method: method)
            } else {
                dataTask.cancel()
                request(network, type: type, method: method)
            }
        }

        request(network, type: type, method: method)
    }
    
    private
    func request<T: Codable>(_ network: NetworkAPI, type: T.Type, method: HTTPMethod) {
        let urlString = network.baseUrl.appendingPathComponent(network.path).absoluteString.removingPercentEncoding
        guard let url = URL(string: urlString ?? "") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        let session = URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            if let error = error {
                self.interactor?.failed(error.localizedDescription, network: network)
                return
            }
            
            guard let `data` = data else { return }
            let response = NetworkData(data: data)
            
            guard let object = response.decode(type) else {
                self.interactor?.failed("Failed populate data", network: network)
                return
            }
           
            self.interactor?.success(object, network: network)
        }
        
        session.resume()
        
    }
}
