{{/*
Expand the name of the chart.
*/}}
{{- define "vnc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Create a fullname using the release name and the chart name.
*/}}
{{- define "vnc.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- $name := include "vnc.name" . -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end }}
{{- end }}

{{/*
Define the chart name and version.
*/}}
{{- define "vnc.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end }}

{{/*
Create chart labels.
*/}}
{{- define "vnc.labels" -}}
helm.sh/chart: {{ .Chart.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/name: {{ include "vnc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}