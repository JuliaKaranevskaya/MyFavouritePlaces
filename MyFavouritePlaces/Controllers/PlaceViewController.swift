//
//  PlaceViewController.swift
//  MyFavouritePlaces
//
//  Created by Юлия Караневская on 3.09.21.
//

import UIKit

class PlaceViewController: UITableViewController {
    
    var imagePickedBlock: ((UIImage) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        title = "New Place"
        hideKeyboardWhenTappedAround()
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelScreen))
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(savePlace))
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = saveButton
        tableView.register(ImageOfPlaceViewCell.self, forCellReuseIdentifier: ImageOfPlaceViewCell.identifierOfImageOfPlaceCell)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(InfoOfPlaceViewCell.self, forCellReuseIdentifier: InfoOfPlaceViewCell.identifierOfInfoOfPlaceViewCell)
      
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImageOfPlaceViewCell.identifierOfImageOfPlaceCell) as! ImageOfPlaceViewCell
            self.imagePickedBlock = { newImage in
                cell.imageView?.image = newImage
            }
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: InfoOfPlaceViewCell.identifierOfInfoOfPlaceViewCell, for: indexPath) as! InfoOfPlaceViewCell
            cell.placeLabel.text = "Name"
            cell.placeTextField.placeholder = "Name"
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: InfoOfPlaceViewCell.identifierOfInfoOfPlaceViewCell, for: indexPath) as! InfoOfPlaceViewCell
            cell.placeLabel.text = "Location"
            cell.placeTextField.placeholder = "Location"
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: InfoOfPlaceViewCell.identifierOfInfoOfPlaceViewCell, for: indexPath) as! InfoOfPlaceViewCell
            cell.placeLabel.text = "Type"
            cell.placeTextField.placeholder = "Type"
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 250
        }
        return 100
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
        
        let cameraIcon = UIImage(systemName: "camera")
        let photoIcon = UIImage(systemName: "photo")
        
        let actionSheet = UIAlertController(title: "Photo", message: "", preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "Camera", style: .default) { _ in
            self.chooseImagePickerController(source: .camera)
        }
        camera.setValue(cameraIcon, forKey: "image")
        camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        
        let photoLibrary = UIAlertAction(title: "Photo Library", style: .default) { _ in
            self.chooseImagePickerController(source: .photoLibrary)
        }
        photoLibrary.setValue(photoIcon, forKey: "image")
        photoLibrary.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        actionSheet.addAction(camera)
        actionSheet.addAction(photoLibrary)
        actionSheet.addAction(cancel)
        present(actionSheet, animated: true)
    }
}

extension PlaceViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func chooseImagePickerController(source: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }


    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.editedImage] as? UIImage {
           self.imagePickedBlock?(image)
       } else {
           print("Something went wrong")
       }
        
       tableView.reloadData()
       picker.dismiss(animated: true)

    }
}
