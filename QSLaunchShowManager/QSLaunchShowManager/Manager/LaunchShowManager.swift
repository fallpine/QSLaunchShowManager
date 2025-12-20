//
//  LaunchShowManager.swift
//  QSLaunchShowManager
//
//  Created by MacM2 on 12/20/25.
//

import UIKit

public class LaunchShowManager {
  /// 设置下次显示时间
  ///
  /// - Parameter secondInterval: 下次显示时间间隔，默认是12小时
  public static func setNextShowTime(secondInterval: TimeInterval = 12 * 60 * 60) {
    let nextShowTime = Date().timeIntervalSince1970 + secondInterval
    UserDefaults.standard.set(nextShowTime, forKey: "LaunchShowExpireTime")
  }

  /// 是否需要显示引导页
  ///
  /// - Returns: 是否需要显示引导页
  public static func needShow() -> Bool {
    if let nextShowTime = UserDefaults.standard.object(forKey: "LaunchShowExpireTime") as? Double {
      return nextShowTime <= Date().timeIntervalSince1970
    } else {
      return false
    }
  }
}
