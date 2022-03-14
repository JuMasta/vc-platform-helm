{{/*
Expand the name of the chart.
*/}}
{{- define "VirtoCommerce-Platform.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "VirtoCommerce-Platform.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "VirtoCommerce-Platform.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}

{{- define "VirtoCommerce-Platform.labels" -}}
{{ include "VirtoCommerce-Platform.selectorLabels" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "VirtoCommerce-Platform.selectorLabels" -}}
app: vc-platform
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "VirtoCommerce-Platform.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "VirtoCommerce-Platform.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
