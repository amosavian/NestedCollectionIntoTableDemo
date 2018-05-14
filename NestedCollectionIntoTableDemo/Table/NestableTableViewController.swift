//
//  NestableTableViewController.swift
//  NestedCollectionIntoTableDemo
//
//  Created by Amir Abbas on 2/24/1397 AP.
//  Copyright © 1397 AP Amir Abbas. All rights reserved.
//

import UIKit

let colors: [UIColor] = [.red, .green, .blue,
                         .gray, .purple, .cyan,
                         .magenta, .yellow, .black,
                         .brown, .lightGray, .orange]
let colorDescs: [UIColor: String] = [.red: "Red", .green: "Green", .blue: "Blue",
                                     .gray: "Gray", .purple: "Purple", .cyan: "Cyan",
                                     .magenta: "Magenta", .yellow: "Yellow", .black: "Black",
                                     .brown: "Brown", .lightGray: "Light Gray", .orange: "Orange"]

class NestableTableViewController: UITableViewController {
    
    var _storedContentOffsets = [Int: CGPoint]()
    
    lazy var dataSources: [[UIColor]] = {
        var result = [[UIColor]]()
        result.reserveCapacity(50)
        for _ in 0..<50 {
            result.append(colors.shuffle())
        }
        return result
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        title = "Colored"
        tableView.rowHeight = 100
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSources.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nestedCollection", for: indexPath) as! ContainerTableViewCell

        // Configure the cell...
        cell.dataSource = dataSources[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let contentOffset = _storedContentOffsets[indexPath.row] {
            (cell as! ContainerTableViewCell).contentOffset = contentOffset
        }
        //_storedContentOffsets[indexPath.row].map { (cell as! ContainerTableViewCell).contentOffset = $0 }
        
        // Configure the cell view...
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let offset = (cell as! ContainerTableViewCell).contentOffset
        if offset != .zero {
            _storedContentOffsets[indexPath.row] = offset
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
