//
//  NewSharesAnalysisTableViewController.swift
//  newSharesFilter
//
//  Created by Riley Lai on 2022/8/6.
//

import UIKit

class NewSharesAnalysisTableViewController: UITableViewController {
  
  var shares = [NewShare]()

  override func viewDidLoad() {
    super.viewDidLoad()

    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(analyzeNewShare))
    
    let share1 = NewShare()
    let share2 = NewShare()
    let share3 = NewShare()
    
    share1.companyName = "A company"
    share1.stockCode = "1234"
    share1.marketPrice = 1234.0
    share1.subscriptionPrice = 1000.0
    share1.issueAmount = 400
    
    share2.companyName = "B company"
    share2.stockCode = "1234"
    share2.marketPrice = 1234.0
    share2.subscriptionPrice = 500.0
    share2.issueAmount = 700
    share2.tradingAmount = 350
    share2.everLowerInHalfYear = false
    share2.didDropThreeDays = false
    
    share3.companyName = "C company"
    share3.stockCode = "1234"
    share3.marketPrice = 1234.0
    share3.subscriptionPrice = 1300.0
    share3.issueAmount = 400
    
    shares = [share1, share2, share3]
  }

  // MARK: - Table view data source

  override func numberOfSections(in tableView: UITableView) -> Int {
    1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    shares.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "NewShareCell", for: indexPath)
    // 從iOS15開始，建議改用UIListContentConfiguration，以下試用
    var content = cell.defaultContentConfiguration()
    let share = shares[indexPath.row]
    content.text = "\(share.companyName) \(share.stockCode)"
    content.secondaryText = "價差：\(share.difference)   預期報酬：\(String(Int((share.returnRate) * 100.0)) + "%")"
    content.image = UIImage(systemName: "circle.fill")?.withTintColor(share.color, renderingMode: .alwaysOriginal)
    cell.contentConfiguration = content
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "ShowOldAnalysis", sender: shares[indexPath.row])
  }
  
  @objc func analyzeNewShare() {
    performSegue(withIdentifier: "AnalyzeNewShare", sender: nil)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "ShowOldAnalysis" {
      guard let newShareAnalysisVC = segue.destination as? NewShareAnalysisViewController,
            let share = sender as? NewShare else {
        return
      }
      newShareAnalysisVC.newShare = share
    }
  }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
