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

