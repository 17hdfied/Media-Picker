//
//  ViewController.swift
//  Dude
//
//  Created by Hardik Wason on 07/10/18.
//  Copyright © 2018 Hardik Wason. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var tableview: UITableView!
    var imaged : NSMutableArray = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func Tap_btn(_ sender: Any) {
        imagepicker.allowsEditing = true
        imagepicker.sourceType = .photoLibrary
        imagepicker.delegate = self
        self.present(imagepicker, animated: true, completion: nil)
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var selectedImage : UIImage!
       if let editedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
       {
        selectedImage = editedImage
        print("Hd:COOL")
        }
        else
       {
         selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        print("HD: Not cool")
        }
        self.imaged.add(selectedImage)
        self.dismiss(animated: true, completion: nil)
        tableview.reloadData()
        
    }

   
    let imagepicker = UIImagePickerController()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imaged.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cells", for: indexPath) as! CellsView
        cell.img.image = imaged[indexPath.row] as? UIImage
        print("cool")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }


}

