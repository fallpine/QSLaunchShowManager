# QSLaunchShowManager

一个用于管理 App 启动引导页展示时机的轻量级 Swift 工具。

`QSLaunchShowManager` 会把下次允许展示的时间保存到 `UserDefaults`，你可以在 App 启动时判断是否需要展示引导页，并在展示后设置下一次展示时间。

## 安装

### CocoaPods

在 `Podfile` 中添加：

```ruby
pod 'QSLaunchShowManager'
```

然后执行：

```bash
pod install
```

## 使用方法

先导入模块：

```swift
import QSLaunchShowManager
```

在 App 启动或进入首页时判断是否需要展示引导页：

```swift
if LaunchShowManager.needShow() {
    // 展示引导页、广告页或活动弹窗
}
```

展示完成后，设置下一次允许展示的时间。默认间隔为 12 小时：

```swift
LaunchShowManager.setNextShowTime()
```

也可以自定义时间间隔，例如 24 小时后再展示：

```swift
LaunchShowManager.setNextShowTime(secondInterval: 24 * 60 * 60)
```

## 方法说明

### `needShow() -> Bool`

判断当前是否已经到达下次展示时间。

如果之前没有调用过 `setNextShowTime`，默认返回 `false`。

### `setNextShowTime(secondInterval:)`

设置下一次允许展示的时间。

参数 `secondInterval` 表示从当前时间开始，间隔多少秒后可以再次展示，默认值为 `12 * 60 * 60`。

## 示例

```swift
func checkLaunchGuide() {
    guard LaunchShowManager.needShow() else {
        return
    }

    showLaunchGuide {
        LaunchShowManager.setNextShowTime()
    }
}
```

## 要求

- iOS 12.0+
- Swift 5

## License

QSLaunchShowManager is available under the MIT license. See the `LICENSE` file for more info.
