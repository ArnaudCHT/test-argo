{{- define "test-apisix.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "test-apisix.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name (include "test-apisix.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "test-apisix.labels" -}}
app.kubernetes.io/name: {{ include "test-apisix.name" . }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- /* Return the release namespace, defaulting to "default" if empty */ -}}
{{- define "test-apisix.namespace" -}}
{{- if .Release.Namespace -}}{{ .Release.Namespace }}{{- else -}}default{{- end -}}
{{- end -}}

{{- /* Convenience: prefix used by APISIX consumer whitelist (ns_name) */ -}}
{{- define "test-apisix.nsPrefix" -}}
{{ include "test-apisix.namespace" . }}_
{{- end -}}

{{- /* Sanitized namespace (replace '-' by '_') */ -}}
{{- define "test-apisix.namespaceSanitized" -}}
{{- $ns := include "test-apisix.namespace" . -}}
{{- $ns | replace "-" "_" -}}
{{- end -}}

{{- /* Prefix built from sanitized namespace followed by '_' */ -}}
{{- define "test-apisix.nsPrefixSanitized" -}}
{{- printf "%s_" (include "test-apisix.namespaceSanitized" .) -}}
{{- end -}}


