//
//  Networking.swift
//  TopPop
//
//  Created by Domagoj Biškup on 07/05/2021.
//

import Alamofire
import Foundation
import Kingfisher

private let url1 = "https://api.deezer.com/chart"
private let url2 = "https://api.deezer.com/album"

var deezerChart: DeezerChart?
var albumTracks: AlbumTracks?

var arrayIndex: Int?
var albumId: Int?


extension TableViewController {
    func fetchData() {
                AF.request(url1, method: .get).responseDecodable(of: DeezerChart.self) {
                    response in
                    deezerChart = response.value
                    self.saveData()
        }
    }
}

extension DetailViewController {
    func fetchData() {
                AF.request(url2 + "/\(albumId!)" + "/tracks", method: .get).responseDecodable(of: AlbumTracks.self) {
                    response in
                    albumTracks = response.value
                    self.tableView.reloadData()
        }
    }
}

extension UIImageView {
    func setImage(imageUrl: String) {
        self.kf.setImage(with: URL(string: imageUrl))
    }
}
