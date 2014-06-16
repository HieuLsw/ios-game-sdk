## Tích Hợp Twitter với AppotaSDK

### Thêm Twitter.frameword
- Vào Project app’s target settings section -> Build phases chọn
Link Binary with Libraries. Click vào dấu ‘+’  và chọn Twitter.framework -> click vào button Add 


### Cấu hình Twiter key
- tạo TwitterConsumerKey, TwitterConsumerSecret from [https://dev.twitter.com/](https://dev.twitter.com/) (liên hệ với Appota Game team để được  hỗ trợ tạo twitter app hoặc tạo twitter app của tài khoản twitter của bạn). Nếu bạn tự tạo twitter app của bạn , làm ơn làm theo dỡi chỉ dẫn tại https://dev.twitter.com/
- Tạo 2 key *TWITTER_CONSUMER_KEY, TWITTER_CONSUMER_SECRET* trong project's .plit [tham khảo ví dụ cụ thể ](GameIntegration/AppotaGameTest/)
### THêm xử lý login trên Appdelegate
	```objc
	(BOOL) application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    		return [AppotaGameSDKConfigure handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
	}
	```
