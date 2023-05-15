# Nginx With OpenTelemetry

本项目提供 `otel_ngx_module.so` 下载。

注意， 不同 `otel_ngx_module.so` 与 `Nginx` 版本需要匹配， 不能混用。
否则可能出现以下错误。

```log
2023/05/11 14:36:35 [emerg] 1#1: module "/opt/modules/otel_ngx_module.so" version 1024000 instead of 1023004 in /etc/nginx/nginx.conf:1
```


## 在 Nginx 中支持 OpenTelemetry

在项目 [Nginx-Otel-Demo](https://github.com/tangx/nginx-otel-demo) 中已经有详细描述， 可以跳转参考。

## 在 Nginx Ingress Controller 中支持 OpenTelemetry

在 Nginx Ingress Controller 中， 支持的第三方 [OpenTelemetry 插件](https://kubernetes.github.io/ingress-nginx/user-guide/third-party-addons/opentelemetry/) 

虽然在模版配置文件 [`/etc/nginx/template/nginx.tmpl`](https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/rootfs/etc/nginx/template/nginx.tmpl) 是支持了， 但是 `otel_ngx_module.so` 需要额外挂载

```go
{{ if (shouldLoadOpentelemetryModule $cfg $servers) }}
load_module /modules_mount/etc/nginx/modules/otel/otel_ngx_module.so;
{{ end }}
```

其他配置方法， 参考 Nginx Ingress Controller 官方文档。

