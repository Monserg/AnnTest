//
//  NeyworkManager.swift
//  AnnTest
//
//  Created by Sergey Monastyrskiy on 07.11.2020.
//

import UIKit

typealias ComplitionHandler = (model: [Decodable]?, error: String?)

struct NetworkManager {
    // MARK: - GET API functions
    func getPhotographersCountries(completion: @escaping ((ComplitionHandler) -> Void)) {
        let url = URL(string: "https://picsum.photos/v2/list")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard error == nil else {
                completion((nil, error!.localizedDescription))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode), let datas = data else {
                completion((nil, String(describing: response)))
                return
            }
            
            let parseResult = [Photographer].parse(data: datas)
            completion((parseResult.model as! [Photographer], parseResult.error))
        })
        
        task.resume()
    }
}
