{{- define "simple-test-apisix.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "simple-test-apisix.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name (include "simple-test-apisix.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "simple-test-apisix.labels" -}}
app.kubernetes.io/name: {{ include "simple-test-apisix.name" . }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- /* Return the release namespace, defaulting to "default" if empty */ -}}
{{- define "simple-test-apisix.namespace" -}}
{{- if .Release.Namespace -}}{{ .Release.Namespace }}{{- else -}}default{{- end -}}
{{- end -}}

{{- /* Convenience: ns prefix "ns_" if you need ns-qualified names */ -}}
{{- define "simple-test-apisix.nsPrefix" -}}
{{ include "simple-test-apisix.namespace" . }}_
{{- end -}}


