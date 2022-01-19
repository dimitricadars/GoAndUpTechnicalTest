//
//  EpisodeListViewModel.swift
//  GoAndUpTechnicalTest
//
//  Created by Dimitri CADARS on 19/01/2022.
//

import Foundation

class EpisodeListViewModel {
    
    var episodeViewModels = [EpisodeViewModel]()
    
    func numberOfRows(_ section: Int) -> Int {
        return episodeViewModels.count
    }
    
    func getEpisodes(completion: @escaping (Result<[EpisodeViewModel],Error>) -> Void) {
        
        let url = Constants.Urls.urlForEpisodes()
        
        RequestManager.fetchData(url: url) { (response: Result<EpisodeResponse?,NetworkError>) in
            
            DispatchQueue.main.async {
                
                switch response {
                    
                case .success(let data):
                    
                    if let results = data?._embedded.episodes {
                        let arrayOfEpisodeViewModel = results.map{EpisodeViewModel(episode: $0)}
                        completion(.success(arrayOfEpisodeViewModel))
                    }
               
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
}
