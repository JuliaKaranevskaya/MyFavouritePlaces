//
//  PlaceViewController.swift
//  MyFavouritePlaces
//
//  Created by Юлия Караневская on 3.09.21.
//

import UIKit

class PlaceViewController: UITableViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelScreen))
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(savePlace))
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = saveButton
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
    }
    
    func chooseImagePickerController(source: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            return UITableViewCell()
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            callActionSheet()
        }
    }
    
    
    @objc func cancelScreen() {
       
    }
    
    @objc func savePlace() {
        
    }
    
    func callActionSheet() {
        let actionSheet = UIAlertController(title: "Photo", message: "", preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "Camera", style: .default) { _ in
            
        }
        let photoLibrary = UIAlertAction(title: "Photo Library", style: .default) { _ in
            
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            
        }
        actionSheet.addAction(camera)
        actionSheet.addAction(photoLibrary)
        actionSheet.addAction(cancel)
        present(actionSheet, animated: true)
    }
    
    

    

}
