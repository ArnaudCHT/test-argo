# Testing : 


```sh
kubectl port-forward -n v2-apisix svc/apisix-v2-gateway 9080:80
```

```sh
curl "http://127.0.0.1:9080/echo-test"
```

réponse : Hello from APISIX Standalone!