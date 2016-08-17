//
//  ViewController.swift
//  MVVM_test_M
//
//  Created by alex zolin on 15.08.16.
//  Copyright © 2016 alex zolin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    @IBOutlet weak var greetingLabel :  UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    let cellIdentifier = String(Cell)
    var cellsArray = [ViewModel]()
    
    var viewModel: GreetingViewModelProtocol!
        {
        didSet {
            viewModel.updateData {
                self.tableView.reloadData()
                self.activityView.stopAnimating()
                self.activityView.hidden = true
            }

        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    private func setupTableView() {
        self.tableView.registerNib(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 200
        self.tableView.contentInset.top = 20
    }
 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfCities()
    }
    
//    func tableView(tableView: UITableView,
//                   cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cellIdentifier = "Cell"
//        
//        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
//        
//        cellsArray = self.viewModel.showGreetingArray()
//        let text = cellsArray[indexPath.row]
//        let textTitle = text.cityTitle as String
//        cell.textLabel?.text = textTitle
//        return cell
//    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let id = segue.identifier where id == "ShowDetails",
            let detailsController = segue.destinationViewController as? DetailsViewController,
            index = sender as? Int {
            detailsController.viewModel = self.viewModel.detailsViewModel(index)
        }
    }
  
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? Cell {
            
            cell = (UINib(nibName: cellIdentifier, bundle: nil).instantiateWithOwner(nil, options: nil).first as? Cell)!
            cell.viewModel = self.viewModel.cellViewModel(indexPath.row)
            return cell
            
        }
        return (tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? Cell)!
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.performSegueWithIdentifier("ShowDetails", sender: indexPath.row)
    }
  
}

