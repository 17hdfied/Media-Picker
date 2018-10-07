//
//  ViewController2.swift
//  Dude
//
//  Created by Hardik Wason on 07/10/18.
//  Copyright © 2018 Hardik Wason. All rights reserved.
//

import UIKit
import MobileCoreServices
import AVKit
import AVFoundation

class ViewController2: UIViewController,UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
   var video = [URL]()
   var videoURL: NSURL?
    @IBOutlet weak var tableview2: UITableView!
    let imagepicker2 = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableview2.dataSource = self
        tableview2.delegate = self
        
    }

    @IBAction func vid_btn(_ sender: Any) {
        
        imagepicker2.delegate = self
        imagepicker2.sourceType = .photoLibrary
        imagepicker2.mediaTypes = ["public.movie"]
        self.present(imagepicker2, animated: true, completion: nil)
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let vidUrl = info[UIImagePickerControllerPHAsset] as! URL
        video.append(vidUrl)
        tableview2.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return video.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview2.dequeueReusableCell(withIdentifier: "cells2", for: indexPath) as! CellsView2
        
        return cell
    }

}
