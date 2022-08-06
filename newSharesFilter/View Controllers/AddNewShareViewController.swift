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
  
  @IBAction func generateAnalysis(_ sender: UIButton) {
     updateNewShareInfo()
    if newShare.isValid {
      print("valid!")
    } else {
      alertInvalidInput()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    newShare.tradingAmount = 500
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
  }
  
  func updateNewShareInfo() {
    newShare.companyName = companyNameTextField.text!
    newShare.stockCode = String(stockCodeTextField.text!)
    guard let marketPrice = Int(marketPriceTextField.text!),
          let subscriptionPrice = Int(subscriptionPriceTextField.text!),
          let issueAmount = Int(subscriptionPriceTextField.text!) else {
      return
    }
    newShare.marketPrice = Double(marketPrice)
    newShare.subscriptionPrice = Double(subscriptionPrice)
    newShare.issueAmount = issueAmount
  }
  
  func alertInvalidInput() {
    let alert = UIAlertController(title: "Ohoh, 有東西漏填囉", message: "請填寫所有欄位", preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default)
    alert.addAction(action)
    present(alert, animated: true)
  }
}

extension AddNewShareViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}
