//
//  EpisodeViewModel.swift
//  GoAndUpTechnicalTest
//
//  Created by Dimitri CADARS on 19/01/2022.
//

import Foundation

class EpisodeViewModel {
    
    let url: String
    let name: String
    let season: String
    let number: String
    var airdate: String
    let airtime: String
    let runtime: String
    let summary: String
    let imageMedium: String
    let imageOriginal: String
    
    init(episode: Episode) {
        self.url = episode.url
        self.name = episode.name
        self.season = String(episode.season)
        self.number = String(episode.number)
        self.airtime = episode.airtime
        self.runtime = String(episode.runtime) + " min"
        self.summary = episode.summary
        self.imageMedium = episode.image.medium
        self.imageOriginal = episode.image.original
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let date = dateFormatter.date(from: episode.airdate)
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let resultString = dateFormatter.string(from: date!)
        self.airdate = resultString
    }
    
}
