//
//  NewShareAnalysisViewController.swift
//  newSharesFilter
//
//  Created by Riley Lai on 2022/8/6.
//

import UIKit

class NewShareAnalysisViewController: UIViewController {
  
  @IBOutlet weak var companyNameLabel: UILabel!
  @IBOutlet weak var stockCodeLabel: UILabel!
  @IBOutlet weak var marketPriceLabel: UILabel!
  @IBOutlet weak var subscriptionPriceLabel: UILabel!
  @IBOutlet weak var differenceLabel: UILabel!
  @IBOutlet weak var returnRateLabel: UILabel!
  @IBOutlet weak var analysisResultLabel: UILabel!
  @IBOutlet weak var dateAndTimeLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    companyNameLabel.text = "長榮"
    stockCodeLabel.text = "2603"
    marketPriceLabel.text = "99200"
    subscriptionPriceLabel.text = "890000"
    differenceLabel.text = "10200"
    returnRateLabel.text = "-3435"
    analysisResultLabel.text = "有風險，仍建議申購"
    dateAndTimeLabel.text = "2021/12/31 23:59"
    
  }


}
