## Tích hợp GoogleSDK với AppotaSDK

### Cài Đặt GoogleSDK
- Tải Google SDK từ [https://developers.google.com/+/mobile/ios/getting-started](https://developers.google.com/+/mobile/ios/getting-started) hoặc từ [AppotaSDK example](GameIntegration/AppotaGameTest/GooglePlus.framework/)
- Kéo và thả *GoogleOpenSource.framework, GooglePlus.bundle, GooglePlus.framework* vào project của bạn.
- Trong Project app’s target settings section, Chọn Build phases ->
Link Binary with Libraries. Click vào button ‘+’ và thêm vào những framework sau:

```
AddressBook.framework
AssetsLibrary.framework
CoreLocation.framework
CoreMotion.framework
CoreGraphics.framework
CoreText.framework
MediaPlayer.framework
Security.framework
SystemConfiguration.framework
UIKit.framework
```

### Cấu hình GoogleClientID
- Nhận GoogleClientID từ [https://developers.google.com/+/mobile/ios/getting-started](https://developers.google.com/+/mobile/ios/getting-started) (liên hệ Appota Game team để được tạo Google app hoặc bạn tự tạo Google app cho mình). Nếu bạn tự tạo google app, làm ơn tham khảo chỉ dẫn trên developer.google
- Tạo một key tên gọi *GOOGLE_CLIENT_ID* với kiểu giá trị là string, và thêm app ID vào đó.
- Tạo schemes cho google login (in URLTypes), thêm app's bundle id như là url scheme
.plist sau khi hoàn thành cấu hình nhìn sẽ như sau:
 ![](docs/google_config.png)
### Thêm xử lý login trên Appdelegate
- Trong mã nguồn của bạn (sau khi init SDK), hãy set googleClientID bởi function *[AppotaGameSDKConfigure shareConfige].googleClientID = @"YourGoogeClientID"*
- Thêm xử lý mở URL trong  AppDelegate.h bởi hàm sau đây :
		
	```objc
	(BOOL) application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    		return [AppotaGameSDKConfigure handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
	}
	```
