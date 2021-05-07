//
//  DetailViewController.swift
//  TopPop
//
//  Created by Domagoj Biškup on 07/05/2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        self.albumImageView.setImage(imageUrl: topPopChart[arrayIndex!].albumImage)
        self.titleName.text = topPopChart[arrayIndex!].songName
        self.albumName.text = topPopChart[arrayIndex!].albumName
        self.artistName.text = topPopChart[arrayIndex!].artistName
        
        fetchData()
        
        self.tableView.reloadData()
    }
}


extension DetailViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumTracks?.total ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier2, for: indexPath)
        cell.textLabel?.text = albumTracks?.data[indexPath.row].title
        return cell
    }
}

