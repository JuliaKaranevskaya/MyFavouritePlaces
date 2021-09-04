//
//  MainViewController.swift
//  MyFavouritePlaces
//
//  Created by Юлия Караневская on 2.09.21.
//

import UIKit

class MainViewController: UITableViewController {
    
    var places = Place.getPlaces()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        
        let addPlaceButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPlace))
        
        navigationItem.rightBarButtonItem = addPlaceButton

    }
    
    @objc func addNewPlace() {
        let vc = PlaceViewController()
        vc.modalPresentationStyle = .fullScreen
        let nc = UINavigationController(rootViewController: vc)
        nc.title = "New Place"
        present(nc, animated: true, completion: nil)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.cellImageView.image = UIImage(named: places[indexPath.row].image)
        cell.nameLabel.text = places[indexPath.row].name
        cell.typeLabel.text = places[indexPath.row].type
        cell.locationLabel.text = places[indexPath.row].location
       
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
