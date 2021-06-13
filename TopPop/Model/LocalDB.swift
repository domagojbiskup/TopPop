//
//  TopPopChart.swift
//  TopPop
//
//  Created by Domagoj Biškup on 07/05/2021.
//

import Foundation
import RealmSwift

let localDB = try! Realm()
var topPopChart: Results<TopPopChart>!

class TopPopChart: Object {
    @objc dynamic var songID = 0
    @objc dynamic var songName = ""
    @objc dynamic var songPosition = 0
    @objc dynamic var songDuration = 0
    @objc dynamic var albumID = 0
    @objc dynamic var albumName = ""
    @objc dynamic var albumImage = ""
    @objc dynamic var artistID = 0
    @objc dynamic var artistName = ""
    @objc dynamic var artistImage = ""
    
    override static func primaryKey() -> String? {
        return "songID"
    }
}

extension TableViewController {
    func saveData () {
        print("--> LocalDB \(Realm.Configuration.defaultConfiguration.fileURL!)")
        
        for i in 0..<deezerChart!.tracks.data.count {
            let topPopChart = TopPopChart()
            topPopChart.songID = deezerChart?.tracks.data[i].id ?? 0
            topPopChart.songName = deezerChart?.tracks.data[i].title ?? ""
            topPopChart.songPosition = deezerChart?.tracks.data[i].position ?? 0
            topPopChart.songDuration = deezerChart?.tracks.data[i].duration ?? 0
            topPopChart.albumID = deezerChart?.tracks.data[i].album.id ?? 0
            topPopChart.albumName = deezerChart?.tracks.data[i].album.title ?? ""
            topPopChart.albumImage = deezerChart?.tracks.data[i].album.coverMedium ?? ""
            topPopChart.artistID = deezerChart?.tracks.data[i].artist.id ?? 0
            topPopChart.artistName = deezerChart?.tracks.data[i].artist.name ?? ""
            topPopChart.artistImage = deezerChart?.tracks.data[i].artist.picture ?? ""
            
            try! localDB.write {
                localDB.add(topPopChart, update: .modified)
                self.tableView.reloadData()
            }
        }
    }
}
