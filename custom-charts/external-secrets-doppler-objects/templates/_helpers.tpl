{{/*
Expand the name of the chart.
*/}}
{{- define "external-secrets-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "external-secrets-chart.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "external-secrets-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version }}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "external-secrets-chart.labels" -}}
app.kubernetes.io/name: {{ include "external-secrets-chart.name" . }}
helm.sh/chart: {{ include "external-secrets-chart.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}