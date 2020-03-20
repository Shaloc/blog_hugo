---
title: "'shaloc.site' has been HSTS preloaded"
date: 2020-03-20T17:49:39+08:00
tags: ['site']
categories: ['tech']
author: "Shaloc"
draft: false
---

前一段时间由于对运营商劫持状况的担忧，我把所有子站都加上了https，包括用来做任意错误域名定向的`def.shaloc.site`，并且获得了ssllabs和myssl的A+评价。

<!--more-->

![20200320185929.png](https://upaiimg.shaloc.site/pics/20200320185929.png)

![20200320185904.png](https://upaiimg.shaloc.site/pics/20200320185904.png)

测试了一段时间没有问题之后，我决定将本站域名加入HSTS preload列表。此后，如果您使用最新的下列浏览器（以及使用最新的下列浏览器内核的其他浏览器，如QQ浏览器、360安全浏览器、世界之窗浏览器、百度浏览器）访问本站以及本站的任意子域名，您将无法使用http方式连接。

![20200320190455.png](https://upaiimg.shaloc.site/pics/20200320190455.png)

为了能不被劫持地访问本站以及其他互联网上的资源，我强烈建议您更新到所有浏览器的最新版本，这些版本通常具有最新的HSTS preload列表。当然，某些使用陈旧内核的浏览器也可能没有预载最新的HSTS列表，如果我发现了这些浏览器，我会将它们更新到这篇文章中。

需要注意的是，为了满足最新的PCI DSS支付卡行业安全标准，本站点仅开启了TLSv1.2和TLSv1.3的一部分加密方法，具体支持或者不支持的浏览器列表请参考下表。基本上比较新的操作系统集成浏览器和主流的第三方浏览器都是可以支持的。

| 客户端握手模拟                                 | from myssl\.com           |
|-------------------------------------------|--|
| Android 4\.4\.2                         | RSA\(SHA256\)             | TLSv1\.2             | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256    FS      |   |
| Android 5\.0\.0                         | RSA\(SHA256\)             | TLSv1\.2             | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256    FS      |   |
| Android 6\.0                            | RSA\(SHA256\)             | TLSv1\.2 > http/1\.1 | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256    FS      |   |
| Android 7\.0                            | RSA\(SHA256\)             | TLSv1\.2 > h2        | TLS\_ECDHE\_RSA\_WITH\_CHACHA20\_POLY1305\_SHA256    FS |   |
| Android 8\.0                            | RSA\(SHA256\)             | TLSv1\.2 > h2        | TLS\_ECDHE\_RSA\_WITH\_CHACHA20\_POLY1305\_SHA256    FS |   |
| Baiduspider/2\.0                        | RSA\(SHA256\)             | TLSv1\.2             | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256    FS      |   |
| Googlebot/2\.0                          | RSA\(SHA256\)             | TLSv1\.2             | TLS\_ECDHE\_RSA\_WITH\_CHACHA20\_POLY1305\_SHA256    FS |   |
| YandexBot July 2018                     | RSA\(SHA256\)             | TLSv1\.2             | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256    FS      |   |
| 360Spider July 2018                     | RSA\(SHA256\)             | TLSv1\.2             | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256    FS      |   |
| SougouSpider July 2018                  | RSA\(SHA256\)             | TLSv1\.2             | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256    FS      |   |
| Baidu HTTPS认证                           | RSA\(SHA256\)             | TLSv1\.2             | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256    FS      |   |
| BingPreview Jan 2015                    | RSA\(SHA256\)             | TLSv1\.2             | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256    FS      |   |
| Chrome 49 / XP SP3                      | RSA\(SHA256\)             | TLSv1\.2 > h2        | TLS\_ECDHE\_RSA\_WITH\_CHACHA20\_POLY1305\_SHA256    FS |   |
| Chrome 51 / Win 7                       | RSA\(SHA256\)             | TLSv1\.2 > h2        | TLS\_ECDHE\_RSA\_WITH\_CHACHA20\_POLY1305\_SHA256    FS |   |
| Chrome 63 /macOS High Sierra 10\.13\.2  | RSA\(SHA256\)             | TLSv1\.2 > h2        | TLS\_ECDHE\_RSA\_WITH\_CHACHA20\_POLY1305\_SHA256    FS |   |
| Chrome 69 / Win 10                      | RSA\(SHA256\)             | TLSv1\.2 > h2        | TLS\_ECDHE\_RSA\_WITH\_CHACHA20\_POLY1305\_SHA256    FS |   |
| Firefox 31\.3\.0 ESR / Win 7            | RSA\(SHA256\)             | TLSv1\.2             | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256    FS      |   |
| Firefox 47 / Win 7                      | RSA\(SHA256\)             | TLSv1\.2 > h2        | TLS\_ECDHE\_RSA\_WITH\_CHACHA20\_POLY1305\_SHA256    FS |   |
| Firefox 49 / XP SP3                     | RSA\(SHA256\)             | TLSv1\.2 > h2        | TLS\_ECDHE\_RSA\_WITH\_CHACHA20\_POLY1305\_SHA256    FS |   |
| Firefox 49 / Win 7                      | RSA\(SHA256\)             | TLSv1\.2 > h2        | TLS\_ECDHE\_RSA\_WITH\_CHACHA20\_POLY1305\_SHA256    FS |   |
| Firefox 57 /macOS High Sierra 10\.13\.2 | RSA\(SHA256\)             | TLSv1\.2 > h2        | TLS\_ECDHE\_RSA\_WITH\_CHACHA20\_POLY1305\_SHA256    FS |   |
| Firefox 62 / Win 10                     | RSA\(SHA256\)             | TLSv1\.2 > h2        | TLS\_ECDHE\_RSA\_WITH\_CHACHA20\_POLY1305\_SHA256    FS |   |
| IE 6 / XP   No FS1  No SNI2             | 握手失败 （handshake\_failure） |                      |                                                         |   |
| IE 7 / Vista                            | 握手失败 （protocol\_version）  |                      |                                                         |   |
| IE 8 / XP   No FS1  No SNI2             | 握手失败 （protocol\_version）  |                      |                                                         |   |
| IE 8\-10 / Win 7                        | 握手失败 （protocol\_version）  |                      |                                                         |   |
| IE 11 / Win 7                           | RSA\(SHA256\)             | TLSv1\.2             | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_CBC\_SHA256    FS      |   |
| IE 11 / Win 8\.1                        | RSA\(SHA256\)             | TLSv1\.2 > http/1\.1 | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_CBC\_SHA256    FS      |   |
| IE 10 / Win Phone 8\.0                  | 握手失败 （protocol\_version）  |                      |                                                         |   |
| IE 11 / Win Phone 8\.1                  | RSA\(SHA256\)             | TLSv1\.2 > http/1\.1 | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_CBC\_SHA256    FS      |   |
| IE 11 / Win Phone 8\.1 Update           | RSA\(SHA256\)             | TLSv1\.2 > http/1\.1 | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_CBC\_SHA256    FS      |   |
| IE 11 / Win 10                          | RSA\(SHA256\)             | TLSv1\.2             | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256    FS      |   |
| Edge 13 / Win 10                        | RSA\(SHA256\)             | TLSv1\.2 > h2        | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256    FS      |   |
| Edge 13 / Win Phone 10                  | RSA\(SHA256\)             | TLSv1\.2 > h2        | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256    FS      |   |
| Java 6u45  No SNI2                      | 握手失败 （protocol\_version）  |                      |                                                         |   |
| Java 7u25                               | 握手失败 （protocol\_version）  |                      |                                                         |   |
| Java 8u31                               | RSA\(SHA256\)             | TLSv1\.2             | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256    FS      |   |
| OpenSSL 0\.9\.8y                        | 握手失败 （protocol\_version）  |                      |                                                         |   |
| OpenSSL 1\.0\.1l                        | RSA\(SHA256\)             | TLSv1\.2             | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256    FS      |   |
| OpenSSL 1\.0\.2e                        | RSA\(SHA256\)             | TLSv1\.2             | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256    FS      |   |
| Openssl 1\.1\.1                         | RSA\(SHA256\)             | TLSv1\.2             | TLS\_ECDHE\_RSA\_WITH\_CHACHA20\_POLY1305\_SHA256    FS |   |
| Safari 5\.1\.9 / OS X 10\.6\.8          | 握手失败 （protocol\_version）  |                      |                                                         |   |
| Safari 6 / iOS 6\.0\.1                  | RSA\(SHA256\)             | TLSv1\.2             | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_CBC\_SHA256    FS      |   |
| Safari 6\.0\.4 / OS X 10\.8\.4          | 握手失败 （protocol\_version）  |                      |                                                         |   |
| Safari 7 / iOS 7\.1                     | RSA\(SHA256\)             | TLSv1\.2             | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_CBC\_SHA256    FS      |   |
| Safari 7 / OS X 10\.9                   | RSA\(SHA256\)             | TLSv1\.2             | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_CBC\_SHA256    FS      |   |
| Safari 8 / iOS 8\.4                     | RSA\(SHA256\)             | TLSv1\.2             | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_CBC\_SHA256    FS      |   |
| Safari 8 / OS X 10\.10                  | RSA\(SHA256\)             | TLSv1\.2             | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_CBC\_SHA256    FS      |   |
| Safari 9 / iOS 9                        | RSA\(SHA256\)             | TLSv1\.2 > h2        | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256    FS      |   |
| Safari 9 / OS X 10\.11                  | RSA\(SHA256\)             | TLSv1\.2 > h2        | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256    FS      |   |
| Safari 10 / iOS 10                      | RSA\(SHA256\)             | TLSv1\.2 > h2        | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256    FS      |   |
| Safari 10 / OS X 10\.12                 | RSA\(SHA256\)             | TLSv1\.2 > h2        | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256    FS      |   |
| Apple ATS 9 / iOS 9                     | RSA\(SHA256\)             | TLSv1\.2 > h2        | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256    FS      |   |
| Yahoo Slurp Jan 2015                    | RSA\(SHA256\)             | TLSv1\.2             | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256    FS      |   |
| UC浏览器 6                                 | RSA\(SHA256\)             | TLSv1\.2 > h2        | TLS\_ECDHE\_RSA\_WITH\_CHACHA20\_POLY1305\_SHA256    FS |   |
| 360极速浏览器 8                              | RSA\(SHA256\)             | TLSv1\.2 > h2        | TLS\_ECDHE\_RSA\_WITH\_CHACHA20\_POLY1305\_SHA256    FS |   |
| 360浏览器 8                                | RSA\(SHA256\)             | TLSv1\.2 > h2        | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256    FS      |   |
| QQ浏览器 9                                 | RSA\(SHA256\)             | TLSv1\.2 > h2        | TLS\_ECDHE\_RSA\_WITH\_CHACHA20\_POLY1305\_SHA256    FS |   |
| 世界之窗浏览器 7                               | RSA\(SHA256\)             | TLSv1\.2 > h2        | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256    FS      |   |
| 猎豹浏览器 6                                 | RSA\(SHA256\)             | TLSv1\.2 > h2        | TLS\_ECDHE\_RSA\_WITH\_CHACHA20\_POLY1305\_SHA256    FS |   |
| 傲游浏览器 5                                 | RSA\(SHA256\)             | TLSv1\.2             | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256    FS      |   |
| 搜狗浏览器 7                                 | RSA\(SHA256\)             | TLSv1\.2 > h2        | TLS\_ECDHE\_RSA\_WITH\_CHACHA20\_POLY1305\_SHA256    FS |   |
| 百度浏览器 8                                 | RSA\(SHA256\)             | TLSv1\.2             | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_CBC\_SHA256    FS      |   |

| Handshake Simulation                      | | | |
|-------------------------------------------|--|--|--|
| Android 4\.4\.2                           | RSA 2048 \(SHA256\)   | TLS 1\.2               | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256   ECDH secp256r1  FS      |
| Android 5\.0\.0                           | RSA 2048 \(SHA256\)   | TLS 1\.2               | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256   ECDH secp256r1  FS      |
| Android 6\.0                              | RSA 2048 \(SHA256\)   | TLS 1\.2 > http/1\.1   | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256   ECDH secp256r1  FS      |
| Android 7\.0                              | RSA 2048 \(SHA256\)   | TLS 1\.2 > h2          | TLS\_ECDHE\_RSA\_WITH\_CHACHA20\_POLY1305\_SHA256   ECDH x25519  FS    |
| Android 8\.0                              | RSA 2048 \(SHA256\)   | TLS 1\.2 > h2          | TLS\_ECDHE\_RSA\_WITH\_CHACHA20\_POLY1305\_SHA256   ECDH x25519  FS    |
| Android 8\.1                              | \-                    | TLS 1\.3               | TLS\_AES\_256\_GCM\_SHA384   ECDH x25519  FS                           |
| Android 9\.0                              | \-                    | TLS 1\.3               | TLS\_AES\_256\_GCM\_SHA384   ECDH x25519  FS                           |
| BingPreview Jan 2015                      | RSA 2048 \(SHA256\)   | TLS 1\.2               | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256   ECDH secp256r1  FS      |
| Chrome 49 / XP SP3                        | RSA 2048 \(SHA256\)   | TLS 1\.2 > h2          | TLS\_ECDHE\_RSA\_WITH\_CHACHA20\_POLY1305\_SHA256   ECDH secp256r1  FS |
| Chrome 69 / Win 7  R                      | RSA 2048 \(SHA256\)   | TLS 1\.2 > h2          | TLS\_ECDHE\_RSA\_WITH\_CHACHA20\_POLY1305\_SHA256   ECDH x25519  FS    |
| Chrome 70 / Win 10                        | \-                    | TLS 1\.3               | TLS\_AES\_256\_GCM\_SHA384   ECDH x25519  FS                           |
| Chrome 75 / Win 10  R                     | \-                    | TLS 1\.3               | TLS\_AES\_256\_GCM\_SHA384   ECDH x25519  FS                           |
| Firefox 31\.3\.0 ESR / Win 7              | RSA 2048 \(SHA256\)   | TLS 1\.2               | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256   ECDH secp256r1  FS      |
| Firefox 47 / Win 7  R                     | RSA 2048 \(SHA256\)   | TLS 1\.2 > h2          | TLS\_ECDHE\_RSA\_WITH\_CHACHA20\_POLY1305\_SHA256   ECDH secp256r1  FS |
| Firefox 49 / XP SP3                       | RSA 2048 \(SHA256\)   | TLS 1\.2 > h2          | TLS\_ECDHE\_RSA\_WITH\_CHACHA20\_POLY1305\_SHA256   ECDH secp256r1  FS |
| Firefox 62 / Win 7  R                     | RSA 2048 \(SHA256\)   | TLS 1\.2 > h2          | TLS\_ECDHE\_RSA\_WITH\_CHACHA20\_POLY1305\_SHA256   ECDH x25519  FS    |
| Firefox 67 / Win 10  R                    | \-                    | TLS 1\.3               | TLS\_AES\_256\_GCM\_SHA384   ECDH x25519  FS                           |
| Googlebot Feb 2018                        | RSA 2048 \(SHA256\)   | TLS 1\.2               | TLS\_ECDHE\_RSA\_WITH\_CHACHA20\_POLY1305\_SHA256   ECDH x25519  FS    |
| IE 11 / Win 7  R                          | RSA 2048 \(SHA256\)   | TLS 1\.2               | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_CBC\_SHA256   ECDH secp256r1  FS      |
| IE 11 / Win 8\.1  R                       | RSA 2048 \(SHA256\)   | TLS 1\.2 > http/1\.1   | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_CBC\_SHA256   ECDH secp256r1  FS      |
| IE 11 / Win Phone 8\.1  R                 | RSA 2048 \(SHA256\)   | TLS 1\.2 > http/1\.1   | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_CBC\_SHA256   ECDH secp256r1  FS      |
| IE 11 / Win Phone 8\.1 Update  R          | RSA 2048 \(SHA256\)   | TLS 1\.2 > http/1\.1   | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_CBC\_SHA256   ECDH secp256r1  FS      |
| IE 11 / Win 10  R                         | RSA 2048 \(SHA256\)   | TLS 1\.2 > h2          | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256   ECDH secp256r1  FS      |
| Edge 15 / Win 10  R                       | RSA 2048 \(SHA256\)   | TLS 1\.2 > h2          | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256   ECDH x25519  FS         |
| Edge 16 / Win 10  R                       | RSA 2048 \(SHA256\)   | TLS 1\.2 > h2          | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256   ECDH x25519  FS         |
| Edge 18 / Win 10  R                       | RSA 2048 \(SHA256\)   | TLS 1\.2 > h2          | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256   ECDH x25519  FS         |
| Edge 13 / Win Phone 10  R                 | RSA 2048 \(SHA256\)   | TLS 1\.2 > h2          | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256   ECDH secp256r1  FS      |
| Java 8u161                                | RSA 2048 \(SHA256\)   | TLS 1\.2               | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256   ECDH secp256r1  FS      |
| Java 11\.0\.3                             | \-                    | TLS 1\.3               | TLS\_AES\_256\_GCM\_SHA384   ECDH secp256r1  FS                        |
| Java 12\.0\.1                             | \-                    | TLS 1\.3               | TLS\_AES\_256\_GCM\_SHA384   ECDH secp256r1  FS                        |
| OpenSSL 1\.0\.1l  R                       | RSA 2048 \(SHA256\)   | TLS 1\.2               | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256   ECDH secp256r1  FS      |
| OpenSSL 1\.0\.2s  R                       | RSA 2048 \(SHA256\)   | TLS 1\.2               | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256   ECDH secp256r1  FS      |
| OpenSSL 1\.1\.0k  R                       | RSA 2048 \(SHA256\)   | TLS 1\.2               | TLS\_ECDHE\_RSA\_WITH\_CHACHA20\_POLY1305\_SHA256   ECDH x25519  FS    |
| OpenSSL 1\.1\.1c  R                       | \-                    | TLS 1\.3               | TLS\_AES\_256\_GCM\_SHA384   ECDH x25519  FS                           |
| Safari 6 / iOS 6\.0\.1                    | RSA 2048 \(SHA256\)   | TLS 1\.2               | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_CBC\_SHA256   ECDH secp256r1  FS      |
| Safari 7 / iOS 7\.1  R                    | RSA 2048 \(SHA256\)   | TLS 1\.2               | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_CBC\_SHA256   ECDH secp256r1  FS      |
| Safari 7 / OS X 10\.9  R                  | RSA 2048 \(SHA256\)   | TLS 1\.2               | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_CBC\_SHA256   ECDH secp256r1  FS      |
| Safari 8 / iOS 8\.4  R                    | RSA 2048 \(SHA256\)   | TLS 1\.2               | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_CBC\_SHA256   ECDH secp256r1  FS      |
| Safari 8 / OS X 10\.10  R                 | RSA 2048 \(SHA256\)   | TLS 1\.2               | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_CBC\_SHA256   ECDH secp256r1  FS      |
| Safari 9 / iOS 9  R                       | RSA 2048 \(SHA256\)   | TLS 1\.2 > h2          | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256   ECDH secp256r1  FS      |
| Safari 9 / OS X 10\.11  R                 | RSA 2048 \(SHA256\)   | TLS 1\.2 > h2          | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256   ECDH secp256r1  FS      |
| Safari 10 / iOS 10  R                     | RSA 2048 \(SHA256\)   | TLS 1\.2 > h2          | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256   ECDH secp256r1  FS      |
| Safari 10 / OS X 10\.12  R                | RSA 2048 \(SHA256\)   | TLS 1\.2 > h2          | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256   ECDH secp256r1  FS      |
| Safari 12\.1\.2 / MacOS 10\.14\.6 Beta  R | \-                    | TLS 1\.3               | TLS\_AES\_256\_GCM\_SHA384   ECDH x25519  FS                           |
| Safari 12\.1\.1 / iOS 12\.3\.1  R         | \-                    | TLS 1\.3               | TLS\_AES\_256\_GCM\_SHA384   ECDH x25519  FS                           |
| Apple ATS 9 / iOS 9  R                    | RSA 2048 \(SHA256\)   | TLS 1\.2 > h2          | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256   ECDH secp256r1  FS      |
| Yahoo Slurp Jan 2015                      | RSA 2048 \(SHA256\)   | TLS 1\.2               | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256   ECDH secp256r1  FS      |
| YandexBot Jan 2015                        | RSA 2048 \(SHA256\)   | TLS 1\.2               | TLS\_ECDHE\_RSA\_WITH\_AES\_128\_GCM\_SHA256   ECDH secp256r1  FS      |

| \# Not simulated clients \(Protocol mismatch\)                                                                              | |
|-----------------------------------------------------------------------------------------------------------------------------|--|
| Android 2\.3\.7   No SNI 2                                                                                                  | Protocol mismatch \(not simulated\) |
| Android 4\.0\.4                                                                                                             | Protocol mismatch \(not simulated\) |
| Android 4\.1\.1                                                                                                             | Protocol mismatch \(not simulated\) |
| Android 4\.2\.2                                                                                                             | Protocol mismatch \(not simulated\) |
| Android 4\.3                                                                                                                | Protocol mismatch \(not simulated\) |
| Baidu Jan 2015                                                                                                              | Protocol mismatch \(not simulated\) |
| IE 6 / XP   No FS 1   No SNI 2                                                                                              | Protocol mismatch \(not simulated\) |
| IE 7 / Vista                                                                                                                | Protocol mismatch \(not simulated\) |
| IE 8 / XP   No FS 1   No SNI 2                                                                                              | Protocol mismatch \(not simulated\) |
| IE 8\-10 / Win 7  R                                                                                                         | Protocol mismatch \(not simulated\) |
| IE 10 / Win Phone 8\.0                                                                                                      | Protocol mismatch \(not simulated\) |
| Java 6u45   No SNI 2                                                                                                        | Protocol mismatch \(not simulated\) |
| Java 7u25                                                                                                                   | Protocol mismatch \(not simulated\) |
| OpenSSL 0\.9\.8y                                                                                                            | Protocol mismatch \(not simulated\) |
| Safari 5\.1\.9 / OS X 10\.6\.8                                                                                              | Protocol mismatch \(not simulated\) |
| Safari 6\.0\.4 / OS X 10\.8\.4  R                                                                                           | Protocol mismatch \(not simulated\) |

\(1\) Clients that do not support Forward Secrecy \(FS\) are excluded when determining support for it\.

\(2\) No support for virtual SSL hosting \(SNI\)\. Connects to the default site if the server uses SNI\.

\(3\) Only first connection attempt simulated\. Browsers sometimes retry with a lower protocol version\.
\(R\) Denotes a reference browser or client, with which we expect better effective security\.

\(All\) We use defaults, but some platforms do not use their best protocols and features \(e\.g\., Java 6 & 7, older IE\)\.

\(All\) Certificate trust is not checked in handshake simulation, we only perform TLS handshake\.

如果您使用特定的浏览器无法访问本站的某些子站点，并且提示的是https证书相关错误，请在这里留言。
