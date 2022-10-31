//
//  ViewController.swift
//  Assessment
//
//  Created by Jobins John on 2022-10-31.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var mainTableView: UITableView!
    @IBOutlet weak private var segmentControl: UISegmentedControl!
    var garmentsArray = [Garments]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUi()
        fetchGarments()
    }
    
    // MARK: - View Init Method
    func initUi()
    {
        mainTableView.tableFooterView = UIView(frame: CGRect.zero)
        
        if #available(iOS 13.0, *) {
            segmentControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
            segmentControl.selectedSegmentTintColor = UIColor.blue
        } else {
            segmentControl.tintColor = UIColor.blue
        }
    }
    
    // MARK: - Core Data Fetch
    func fetchGarments() {
        if let garmentArray = CoredataManager.shared.fetch(Garments.self) {
            if garmentArray.count > 0 {
                self.garmentsArray = garmentArray
                segmentHandler(segmentControl)
                
            }
        }
    }
    
    // MARK: - UINavigationController Delegate Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navController = segue.destination as? UINavigationController {
            if let viewCont = navController.topViewController as? AddGarmentController {
                viewCont.addGarmentProtocol = self
            }
        }
    }
    
    // MARK: - Event Handlers
    @IBAction func segmentHandler(_ sender: UISegmentedControl) {
        if garmentsArray.count > 0 {
            if sender.selectedSegmentIndex == 0 {
                garmentsArray = garmentsArray.sorted(by: { (garment1, garment2) -> Bool in
                    return garment1.garmentName?.compare(garment2.garmentName!) == ComparisonResult.orderedAscending
                })
            } else {
                garmentsArray = garmentsArray.sorted(by: { (date1, date2) -> Bool in
                    return date1.createdTime?.compare(date2.createdTime!) == ComparisonResult.orderedDescending
                })
            }
            mainTableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if garmentsArray.count > 0 {
            return garmentsArray.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let garmentsCell = tableView.dequeueReusableCell(withIdentifier: "GarmentsCell") else { return UITableViewCell() }
        if garmentsArray.count > 0 {
            garmentsCell.contentView.backgroundColor = UIColor.white
            let garmentModel = garmentsArray[indexPath.row]
            garmentsCell.textLabel?.text = garmentModel.garmentName
        } else {
            garmentsCell.contentView.backgroundColor = UIColor.lightGray
            garmentsCell.textLabel?.text = "No garments added..."
        }
        return garmentsCell
    }
}

extension ViewController: AddGarmentProtocol {
    func updateTableData() {
        fetchGarments()
    }
}

