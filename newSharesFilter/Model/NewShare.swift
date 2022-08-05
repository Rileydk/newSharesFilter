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
  
  let companyName = ""
  let stockCode = ""
  let marketPrice = 0
  let subscriptionPrice = 0
  let issueAmount = 0
  let everLowerInHalfYear = false
  let didDropThreeDays = false
  let isIPO = false
  let tradingAmount = 0
  
  var difference: Int {
    marketPrice - subscriptionPrice
  }
  var returnRate: Double {
    Double(difference) / Double(marketPrice)
  }
  var isInLowDemand: Bool {
    (tradingAmount < 10) || ((Double(tradingAmount) / Double(issueAmount)) < 0.1)
  }
  var reachStandard: Bool {
    (marketPrice >= 100_000 && returnRate >= 0.15) || (marketPrice > 100_000 && returnRate >= 0.1)
  }
  var forbidden: Bool {
    difference < 0 || (difference < 2500 && returnRate < 0.1)
  }
  var getExtraPoint: Bool {
    (marketPrice >= 100_000 && returnRate >= 0.2) || (marketPrice > 100_000 && returnRate >= 0.15) || isIPO
  }
  var getExtraRisk: Bool {
    everLowerInHalfYear || didDropThreeDays || isInLowDemand
  }
  
  var result: Result {
    if forbidden {
      return .forbidden
    } else if reachStandard {
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
