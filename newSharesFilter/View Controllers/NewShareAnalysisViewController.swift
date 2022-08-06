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
  
  var newShare: NewShare?
  var isNewShare = false
  
  override func viewDidLoad() {
    super.viewDidLoad()

    companyNameLabel.text = newShare?.companyName
    stockCodeLabel.text = newShare?.stockCode
    marketPriceLabel.text = String(Int((newShare?.actualMarketPrice)!))
    subscriptionPriceLabel.text = String(Int((newShare?.actualSubscriptionPrice)!))
    differenceLabel.text = String((newShare?.difference)!)
    returnRateLabel.text = String(Int((newShare?.returnRate)! * 100.0)) + "%"
    analysisResultLabel.text = newShare?.result.rawValue
    analysisResultLabel.backgroundColor = newShare?.color
    
    let date = Date()
    let df = DateFormatter()
    df.dateFormat = "yyyy/MM/dd HH:mm"
    let dateString = df.string(from: date)
    dateAndTimeLabel.text = dateString
    
    if isNewShare {
      navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNewAnalysis))
      navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(discardNewAnalysis))
    }
  }

  @objc func saveNewAnalysis() {
    print("save")
  }
  
  @objc func discardNewAnalysis() {
    print("discard")
  }

}
