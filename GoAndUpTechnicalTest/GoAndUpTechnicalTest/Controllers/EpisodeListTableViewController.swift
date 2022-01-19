//
//  EpisodeListTableViewController.swift
//  GoAndUpTechnicalTest
//
//  Created by Dimitri CADARS on 19/01/2022.
//

import Foundation
import UIKit

class EpisodeListTableViewController: UITableViewController {
    
    var episodeListViewModel = EpisodeListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getEpisodes()
    }
    
    func getEpisodes() {
        
        let loader = self.loader()
        
        episodeListViewModel.getEpisodes { [weak self] result in

            switch result {

            case .success(let arrayOfEpisodeViewModel):
                self?.episodeListViewModel.episodeViewModels = arrayOfEpisodeViewModel
                self?.tableView.reloadData()
                self?.stopLoader(loader: loader)

            case .failure:
                self?.stopLoader(loader: loader)
                self?.displayAlert(message: "Désolé, quelque chose s'est mal passé dans la récupération des données. Veuillez réessayer plus tard",title: "Error")
            }
        }
    }
}

extension EpisodeListTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodeListViewModel.numberOfRows(section)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 118
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath) as! EpisodeCell
        cell.configure(vm: self.episodeListViewModel.episodeViewModels[indexPath.row])
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)  {
        if let cell = sender as? EpisodeCell {
            let episodeIndex = tableView.indexPath(for: cell)!.row
            if segue.identifier == "showDetail" {
                let vc = segue.destination as! EpisodeDetailViewController
                vc.episodeViewModel = episodeListViewModel.episodeViewModels[episodeIndex]
            }
        }
    }
    
}
