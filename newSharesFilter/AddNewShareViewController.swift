//
//  ViewController.swift
//  newSharesFilter
//
//  Created by Riley Lai on 2022/8/5.
//

import UIKit

class AddNewShareViewController: UIViewController {
  
  @IBOutlet weak var companyNameTextField: UITextField!
  @IBOutlet weak var stockCodeTextField: UITextField!
  @IBOutlet weak var marketPriceTextField: UITextField!
  @IBOutlet weak var subscriptionPriceTextField: UITextField!
  @IBOutlet weak var issueAmountTextField: UITextField!
  @IBOutlet weak var tradingAmountLabel: UILabel!
  
  var newShare = NewShare()

  @IBAction func changeValueOfPriceEverLower(_ sender: UISegmentedControl) {
    newShare.everLowerInHalfYear = sender.selectedSegmentIndex == 0
  }
  @IBAction func changeValueOfPriceDidDrop(_ sender: UISegmentedControl) {
    newShare.didDropThreeDays = sender.selectedSegmentIndex == 0
  }
  @IBAction func changeValueOfIsIPO(_ sender: UISegmentedControl) {
    newShare.isIPO = sender.selectedSegmentIndex == 0
  }
  @IBAction func changeValueOfTradingAmount(_ sender: UISlider) {
    let value = Int(sender.value)
    tradingAmountLabel.text = "近1個月交易熱絡程度：\(value == 1000 ? "\(value)以上" : "\(value)")"
    newShare.tradingAmount = value
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    newShare.companyName = "長榮"
    newShare.stockCode = 2133
    newShare.marketPrice = 210
    newShare.subscriptionPrice = 180
    newShare.issueAmount = 2550
    newShare.tradingAmount = 600
    newShare.everLowerInHalfYear = false
    newShare.didDropThreeDays = false
    newShare.isIPO = false
    print(newShare.returnRate)
    print(newShare.result.rawValue)
  }


}

