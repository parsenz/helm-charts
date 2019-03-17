{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "rediscluster.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "rediscluster.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "rediscluster.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create redis cluster persistent volume claim name
*/}}
{{- define "rediscluster.pvc" -}}
{{- printf "%s-%s-cpvc" (include "redis.fullname" .)  (include "phase.unique.name" .) -}}
{{- end -}}

{{/*
Cluster client port name.
*/}}
{{- define "rediscluster.client.port" -}}
{{- $name := .Release.Name | trunc 11 | trimSuffix "-" -}}
{{- printf "%s-clt" $name -}}
{{- end -}}

{{/*
Cluster gossip port name.
*/}}
{{- define "rediscluster.gossip.port" -}}
{{- $name := .Release.Name | trunc 11 | trimSuffix "-" -}}
{{- printf "%s-gsp" $name -}}
{{- end -}}
