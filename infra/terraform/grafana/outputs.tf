locals {
  folder_files = fileset("${path.module}/dashboards", "**/folder.yaml")

  folders = {
    for file in local.folder_files :
    yamldecode(file("${path.module}/dashboards/${file}")).uid =>
    yamldecode(file("${path.module}/dashboards/${file}"))
  }
}

resource "grafana_folder" "this" {
  for_each = local.folders

  uid   = each.key
  title = each.value.title
}

locals {
  dashboard_files = fileset(
    "${path.module}/dashboards",
    "**/*.json"
  )

  dashboards = {
    for file in local.dashboard_files :
    jsondecode(file("${path.module}/dashboards/${file}")).uid =>
    {
      uid         = dirname(dirname(file))
      folder      = dirname(file)
      path        = "${path.module}/dashboards/${file}"
      config_json = jsondecode(file("${path.module}/dashboards/${file}"))
    }
  }
}

resource "grafana_dashboard" "this" {
  for_each = local.dashboards

  folder = grafana_folder.this[
    each.value.folder
  ].uid

  config_json = file(each.value.path)
}
