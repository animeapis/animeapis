# Package {{ (index .Files 0).Package }}

## Index
{{- range .Files }}
{{- if not (contains "internal" .Name) }}
{{- if .HasServices }}
{{- range .Services }}
- [{{.Name}}](#{{.FullName}})
{{- end }}
{{- end }}
{{- if .HasMessages }}
{{- range .Messages }}
- [{{.LongName}}](#{{.FullName}})
{{- end }}
{{- end }}
{{if .HasEnums }}
{{- range .Enums }}
- [{{.LongName}}](#{{.FullName}})
{{- end }}
{{- end }}
{{- end }}
{{- end }}

{{- range .Files }}
{{- if not (contains "internal" .Name) }}
{{- range $service := .Services }}
## <span id="{{.FullName}}">{{.Name}}</span>

{{.Description}}
{{ range .Methods }}
| <span id="{{ $service.FullName }}.{{.Name}}">{{.Name}}</span> |
| --- |
| **rpc {{.Name}}([{{.RequestLongType}}](#{{.RequestFullType}})) [{{.ResponseLongType}}](#{{.ResponseFullType}})**<br/><br/>{{ nobr .Description}} |
{{ end }}
{{- end }}

{{- range .Messages }}

## <span id="{{.FullName}}">{{.LongName}}</span>

{{.Description}}
{{ if .HasFields }}
| Field | Description |
| --- | --- |
{{- range .Fields }}
| {{ if .IsOneof }}**[oneof](https://developers.google.com/protocol-buffers/docs/proto3#oneof)** _{{ .OneofDecl }}_<br />{{ end }}{{.Name}} | **[{{if .IsMap}}map {{else}}{{.Label}} {{end}}{{.LongType}}](#{{.LongType}})**<br/>{{ nobr .Description }} |
{{- end }}{{/* range .Fields */}}
{{- end }}{{/* if .HasFields */}}
{{- end }}{{/* range .Messages */}}

{{- range .Enums }}

## <span id="{{.FullName}}">{{.LongName}}</span>
{{.Description}}

| Name | Description |
| --- | --- |
{{- range .Values }}
| {{.Name}} | {{ if .Description }}{{ nobr .Description }}{{ else }}No description.{{ end }} |
{{- end }}
{{- end }}

{{- end }}
{{- end }}
