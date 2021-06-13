//
//  TableViewController.swift
//  TopPop
//
//  Created by Domagoj Biškup on 07/05/2021.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.startAnimating()
        
        /// TableViewCell Registration
        self.tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier1)

        /// Getting Data
        self.fetchData()
        topPopChart = localDB.objects(TopPopChart.self).sorted(byKeyPath: K.sortByPosition, ascending: true)
        
        self.tableView.reloadData()
        activityIndicator.stopAnimating()
    }

    
    /// Pull to Refresh
    @IBAction func pullToRefresh(_ sender: UIRefreshControl) {
        self.fetchData()
        topPopChart = localDB.objects(TopPopChart.self).sorted(byKeyPath: K.sortByPosition, ascending: true)
        sender.endRefreshing()
        self.tableView.reloadData()
    }
    
    
    /// Sorting
    @IBAction func closeSort(segue: UIStoryboardSegue) {
        self.tableView.reloadData()
    }
        

    /// Tableview Datasource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topPopChart.count//10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier1, for: indexPath) as? TableViewCell {
            cell.tableViewCell = topPopChart[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }

    
    /// Detail VC
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: K.detailsScreen, sender: self)
        arrayIndex = indexPath.row
        albumId = topPopChart[arrayIndex!].albumID
    }
}


