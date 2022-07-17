# GitHub Workflows HTTP Tester

I had a suspicion that HTTP requests leaving a GitHub Workflows
environment might not be what was sent. So, I want to try that.

## External site

I haven't seen anything odd. There is an extra `X-Amzn-Trace-Id`
request header that shows up, but that happens outside GitHub too:

```
$ wget -S -O - https://httpbin.org/headers
--2022-07-17 14:10:59--  https://httpbin.org/headers
Resolving httpbin.org... 34.227.213.82, 3.94.154.124, 34.195.104.96, ...
Connecting to httpbin.org|34.227.213.82|:443... connected.
HTTP request sent, awaiting response...
  HTTP/1.1 200 OK
  Date: Sun, 17 Jul 2022 18:10:59 GMT
  Content-Type: application/json
  Content-Length: 222
  Connection: keep-alive
  Server: gunicorn/19.9.0
  Access-Control-Allow-Origin: *
  Access-Control-Allow-Credentials: true
Length: 222 [application/json]
Saving to: 'STDOUT'

-                                                    0%[                                                                                                                 ]       0  --.-KB/s               {
  "headers": {
    "Accept": "*/*",
    "Accept-Encoding": "identity",
    "Host": "httpbin.org",
    "User-Agent": "Wget/1.20 (darwin19.3.0)",
    "X-Amzn-Trace-Id": "Root=1-62d450b3-698a958907f09b78753085f0"
  }
}
```
