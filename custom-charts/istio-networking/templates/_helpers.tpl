{{- define "encodeAzureJson" -}}
{{- printf "{\n\t\"tenantId\": \"%s\",\n\t\"subscriptionId\": \"%s\",\n\t\"resourceGroup\": \"%s\",\n\t\"aadClientId\": \"%s\",\n\t\"aadClientSecret\": \"%s\"\n}" .Values.azure.tenantId .Values.azure.subscriptionId .Values.azure.resourceGroup .Values.azure.aadClientId .Values.azure.aadClientSecret | b64enc }}
{{- end -}}