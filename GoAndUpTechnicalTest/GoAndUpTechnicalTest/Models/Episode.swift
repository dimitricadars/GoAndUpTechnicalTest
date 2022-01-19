//
//  Episode.swift
//  GoAndUpTechnicalTest
//
//  Created by Dimitri CADARS on 19/01/2022.
//

import Foundation

struct EpisodeResponse: Decodable {
    var _embedded: Episodes
}

struct Episodes : Decodable {
    var episodes: [Episode]
}

struct Image : Decodable {
    var medium: String
    var original: String
}

struct Episode : Decodable {
    var url: String
    var name: String
    var season: Int
    var number: Int
    var airdate: String
    var airtime: String
    var runtime: Int
    var summary: String
    var image: Image
}
