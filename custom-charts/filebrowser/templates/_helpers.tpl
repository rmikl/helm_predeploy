{{- define "filebrowser.name" -}}
{{- default .Chart.Name .Values.nameOverride }}
{{- end }}

{{- define "filebrowser.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride }}
{{- else }}
{{- $name := include "filebrowser.name" . }}
{{- if ne $name "" }}
{{- $name }}
{{- else }}
{{- .Release.Name }}
{{- end }}
{{- end }}
{{- end }}

{{- define "filebrowser.labels" -}}
app: {{ include "filebrowser.name" . }}
app.kubernetes.io/name: {{ include "filebrowser.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
