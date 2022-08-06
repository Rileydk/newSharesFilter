//
//  NewShare.swift
//  newSharesFilter
//
//  Created by Riley Lai on 2022/8/6.
//

import Foundation

class NewShare {
  enum Result: String {
    case highlyRecommended = "必須申購"
    case recommended = "建議申購"
    case tolerable = "有風險，仍建議申購"
    case thinkTwice = "有風險，須審慎評估"
    case notRecommended = "不建議申購"
    case forbidden = "不可申購"
  }
  
  var companyName = ""
  var stockCode = ""
  var marketPrice = 0.0
  var subscriptionPrice = 0.0
  var issueAmount = 0
  var everLowerInHalfYear = true
  var didDropThreeDays = true
  var isIPO = true
  var tradingAmount = 0
  let unit = 1000.0
  
  var isValid: Bool {
    // 暫時將tradingAmount禁止為0
    !(companyName.isEmpty || stockCode.isEmpty || marketPrice.isZero || subscriptionPrice.isZero || issueAmount == 0 || tradingAmount == 0)
  }
  
  // store property的價格是一股的價格，要乘以1000股計算
  var actualMarketPrice: Double {
    marketPrice * unit
  }
  var actualSubscriptionPrice: Double {
    subscriptionPrice * unit
  }
  // 價差
  var difference: Int {
    Int(actualMarketPrice - actualSubscriptionPrice)
  }
  // 報酬率
  var returnRate: Double {
    Double(difference) / actualMarketPrice
  }
  var isInLowDemand: Bool {
    (tradingAmount < 10) || ((Double(tradingAmount) / Double(issueAmount)) < 0.1)
  }
  
  var reachStandard: Bool {
    (actualMarketPrice >= 100_000 && returnRate >= 0.1) || (actualMarketPrice < 100_000 && returnRate >= 0.15)
  }
  var forbidden: Bool {
    difference < 0 || (difference < 2500 && returnRate < 0.1)
  }
  var getExtraPoint: Bool {
    (actualMarketPrice >= 100_000 && returnRate >= 0.2) || (actualMarketPrice > 100_000 && returnRate >= 0.15) || isIPO || difference > 20_000
  }
  var getExtraRisk: Bool {
    everLowerInHalfYear || didDropThreeDays || isInLowDemand
  }
  
  var result: Result {
    if forbidden {
      return .forbidden
    } else if reachStandard {
      print("reach standard")
      if getExtraPoint {
        return getExtraRisk ? .tolerable : .highlyRecommended
      } else {
        return getExtraRisk ? .thinkTwice : .recommended
      }
    } else {
      if getExtraPoint {
        return getExtraRisk ? .thinkTwice : .tolerable
      } else {
        return getExtraRisk ? .notRecommended : .thinkTwice
      }
    }
  }
  
  var color: String {
    switch result {
    case .highlyRecommended:
      return "blue"
    case .recommended:
      return "green"
    case .tolerable:
      return "yellow"
    case .thinkTwice:
      return "orange"
    case .notRecommended:
      return "red"
    case .forbidden:
      return "brown"
    }
  }
}
