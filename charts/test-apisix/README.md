# Testing : 


```sh
kubectl port-forward -n v2-apisix svc/apisix-v2-gateway 9080:80
```

Si le Host est présicé dans le l'apisixRoute : il faut le -H
```sh
curl "http://127.0.0.1:9080/test-tmp/get" -H 'X-API-KEY: toto'
```

reponse exemple :
```json
{
  "args": {},
  "headers": {
    "Accept": "*/*",
    "Host": "httpbin.org",
    "User-Agent": "curl/8.7.1",
    "X-Amzn-Trace-Id": "Root=1-68ff4f07-4e42f9e2214f8d0534a60e0d",
    "X-Api-Key": "toto",
    "X-Forwarded-Host": "127.0.0.1"
  },
  "origin": "127.0.0.1, 143.126.211.254",
  "url": "https://127.0.0.1/get"
}
```