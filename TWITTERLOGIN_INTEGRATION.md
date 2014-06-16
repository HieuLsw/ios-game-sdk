
### Cài Đặt Twitter
- Trong Project app’s target settings section, Chọn Build phases ->
Link Binary with Libraries. Click vào button ‘+’ và thêm framework sau:

```
Twitter.framework
```

### Cấu hình Twitter
- Nhận TwitterConsumerKey, TwitterConsumerSecret bằng cách tạo twitter app từ [https://dev.twitter.com/](https://dev.twitter.com/) (bạn có thể liên hệ với Appota Game team để tạo twitter app hoặc tự tạo Twitter app của bạn ). Nếu bạn tự tạo twitter app của bạn, làm ơn tham khảo tại https://dev.twitter.com/
- Tạo 2 key *TWITTER_CONSUMER_KEY, TWITTER_CONSUMER_SECRET* trong .plist [tham khảo ví dụ cụ thể ](GameIntegration/AppotaGameTest/)
### Thêm xử lý login trên Appdelegate
	```objc
	(BOOL) application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    		return [AppotaGameSDKConfigure handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
	}
	```
