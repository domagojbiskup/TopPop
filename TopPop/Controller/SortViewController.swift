//
//  SortViewController.swift
//  TopPop
//
//  Created by Domagoj Biškup on 07/05/2021.
//

import UIKit

class SortViewController: UIViewController {
    
    @IBAction func normalSort(_ sender: UIButton) {
        topPopChart = localDB.objects(TopPopChart.self).sorted(byKeyPath: K.sortByPosition, ascending: true)
    }
    
    @IBAction func timeAscSort(_ sender: UIButton) {
        topPopChart = localDB.objects(TopPopChart.self).sorted(byKeyPath: K.sortByDuration, ascending: true)
    }
    
    @IBAction func timeDescSort(_ sender: UIButton) {
        topPopChart = localDB.objects(TopPopChart.self).sorted(byKeyPath: K.sortByDuration, ascending: false)
    }
}

