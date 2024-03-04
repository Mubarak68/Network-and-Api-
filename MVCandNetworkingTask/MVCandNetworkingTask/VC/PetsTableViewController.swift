//
//  ViewController.swift
//  MVCandNetworkingTask
//
//  Created by Mubarak Aloraifan on 04/03/2024.
//

import UIKit

class PetsTableViewController: UITableViewController {
    var pets: [Pet] = []
    
    ///Dispatch Queue
    private func fetchPetsData() {
        NetworkManager.shared.fetchPets { fetchedPets in
            DispatchQueue.main.async {
                self.pets = fetchedPets ?? []
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        fetchPetsData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pets.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let pet = pets[indexPath.row]
        cell.textLabel?.text = pet.name
        cell.imageView?.image = UIImage(named: pet.image)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailsViewController()

        let pet = pets[indexPath.row]
        detailVC.pets = pet

        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
}

