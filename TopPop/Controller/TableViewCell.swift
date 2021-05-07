//
//  TableViewCell.swift
//  TopPop
//
//  Created by Domagoj Biškup on 07/05/2021.
//

import UIKit

class TableViewCell: UITableViewCell {
        
    @IBOutlet weak var positionL: UILabel!
    @IBOutlet weak var titleNameL: UILabel!
    @IBOutlet weak var artistNameL: UILabel!
    @IBOutlet weak var durationL: UILabel!
    @IBOutlet weak var artistImageViewL: UIImageView!
    
    var tableViewCell: TopPopChart! {
        didSet {
            self.positionL.text = "\(String(describing: tableViewCell.songPosition))"
            self.titleNameL.text = tableViewCell.songName
            self.durationL.text = secondsToMinutesSeconds(tableViewCell.songDuration)
            self.artistNameL.text = tableViewCell.artistName
            self.artistImageViewL.setImage(imageUrl: tableViewCell.artistImage)
        }
    }

    func secondsToMinutesSeconds (_ songDuration: Int) -> String {
        let minutes = songDuration / 60
        let seconds = songDuration % 60
        if seconds < 10 && seconds >= 0 {
            return "\(minutes)" + ":0" + "\(seconds)"
        }
        return "\(minutes)" + ":" + "\(seconds)"
    }
}
