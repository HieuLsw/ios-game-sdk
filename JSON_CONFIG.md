#Config.json#

Appota Game SDK đang sử dụng một file JSON cấu hình như là một phương thức linh động cho các developer.
Với phương thức này, bạn có thể thiết lập nhiều tùy chọn cho tích hợp login và payment. 
Với bất kỳ ai muốn sử dụng phương thức này, Appota cung cấp cho bạn một tool tên gọi là - ConfigJSON Generator để tạo ra JSON configuration file.

###Làm sao sử dụng ConfigJSON Generator:###

- Chuyển đến URL: [https://developer.appota.com/sdktool.php](https://developer.appota.com/sdktool.php)

- Tick vào tùy chọn bạn cần.

- Click vào button Generate để tạo ra mã JSON.

<hr/>

###1. Tùy Chọn Ứng dụng###

**Check version update**

Check version updates khi login game và force application để update Khi có version mới.

**Đơn vị tiền trong Game**

Sử dụng tiền ảo trong game, bản có thể sử dụng text hoặc ảnh (yêu cầu upload ảnh).

###2. Tùy chọn đăng nhập ###

**Appota User**

Cho phép sử dụng Appota account để đăng nhập.

**Social User**

Cho phép sử dụng Facebook, Twitter, Google account để đăng nhập.

**Fast Login**

Cho phép sử dụng Device ID để đăng nhập.

###3. Tùy chọn thanh toán ###

**SMS**

Cho phép sử dụng phương thức thanh toán qua SMS. Tick chọn và đổi sang tiền ảo
**Card**

Cho phép sử dụng phương thức thanh toán qua Card. Tick chọn và đổi sang tiền ảo.

**Paypal**

Cho phép thanh toán qua Paypal. Nhập số tiền (USD) và đổi sang tiền ảo. 

**Bank**

Cho phép sử dụng phương thức Internet Banking để thanh toán. Nhập số tiền (VND) và đổi sao tiền ảo. 

**Google Play Payment hoặc Apple Payment**

Cho phép tích hợp Google Payment hoặc Apple Payment vào ứng dụng của bạn (phụ thuộc vào ứng dụng của bạn là nền tảng android hay iOS).

Nhập thông tin dưới đây:

- ProductID: IAP mã item được cung cấp bởi Appota.
- Price: Số tiền (USD)
- Name: tên Item
- Game Currency: tiền ảo

###4 - Sample JSON###

Sử dụng những tùy chọn sau:

![](json_sample.png)

Ấn vào button Generate  sẽ show mã JSON sau:

``` json
{"checkUpdate":true,"gameCurrency":{"type":"STRING","data":"VCOIN"},"loginMethods":["LOGIN_APPOTA",
"LOGIN_SOCIAL","LOGIN_FAST"],"paymentMethods":[{"method":"PAYMENT_SMS","options":[{"currency":"VND",
"country":"VN","amounts":[{"amount":500,"gameCurrency":5},{"amount":1000,"gameCurrency":10}]}]},
{"method":"PAYMENT_CARD","options":[{"currency":"VND","country":"VN","amounts":[{"amount":300000,
"gameCurrency":3000}]}]},{"method":"PAYMENT_PAYPAL","currency":"USD","options":[{"country":"VN",
"amounts":[{"amount":10,"gameCurrency":100}]}]},{"method":"PAYMENT_INTERNET_BANKING",
"options":[{"currency":"VND","country":"VN","amounts":[{"amount":10000,"gameCurrency":100}]}]},
{"method":"PAYMENT_GOOGLE_PLAY","items":[{"productid":"com.appota.sample.pack1","price":"10",
"name":"100 Coin","gameCurrency":100},{"productid":"com.appota.sample.pack2","price":"20",
"name":"200 Coin","gameCurrency":200}]}]}
```
