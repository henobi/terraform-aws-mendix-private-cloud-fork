{
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": {
          "type": "grafana",
          "uid": "-- Grafana --"
        },
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "target": {
          "limit": 100,
          "matchAny": false,
          "type": "dashboard"
        },
        "type": "dashboard"
      }
    ]
  },
  "description": "https://grafana.com/dashboards/3119 - Monitors Kubernetes cluster using Prometheus. Shows overall cluster CPU / Memory / Filesystem usage as well as individual pod, containers, control plane (as deployed by kops) statistics. Uses cAdvisor metrics only.\r\nTweaked from original https://grafana.com/dashboards/315 to add templating for:\r\n- adaptable $interval (instead of hardcoded 1m)\r\n- selectable $datasource (very useful to have a single dashboard tackling several prometheis )",
  "editable": true,
  "fiscalYearStartMonth": 0,
  "gnetId": 3119,
  "graphTooltip": 0,
  "id": 12,
  "links": [],
  "liveNow": false,
  "panels": [
    {
      "collapsed": false,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 0
      },
      "id": 33,
      "panels": [],
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "refId": "A"
        }
      ],
      "title": "Network I/O pressure",
      "type": "row"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "uid": "$datasource"
      },
      "decimals": 2,
      "editable": true,
      "error": false,
      "fill": 1,
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 6,
        "w": 24,
        "x": 0,
        "y": 1
      },
      "height": "200px",
      "hiddenSeries": false,
      "id": 32,
      "legend": {
        "alignAsTable": false,
        "avg": true,
        "current": true,
        "max": false,
        "min": false,
        "rightSide": false,
        "show": false,
        "sideWidth": 200,
        "sort": "current",
        "sortDesc": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 2,
      "links": [],
      "nullPointMode": "connected",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "9.3.1",
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "datasource": {
            "uid": "$datasource"
          },
          "expr": "sum (rate (container_network_receive_bytes_total{kubernetes_io_hostname=~\"^$Node$\"}[$interval]))",
          "format": "time_series",
          "interval": "10s",
          "intervalFactor": 1,
          "legendFormat": "Received",
          "metric": "network",
          "refId": "A",
          "step": 10
        },
        {
          "datasource": {
            "uid": "$datasource"
          },
          "expr": "- sum (rate (container_network_transmit_bytes_total{kubernetes_io_hostname=~\"^$Node$\"}[$interval]))",
          "format": "time_series",
          "interval": "10s",
          "intervalFactor": 1,
          "legendFormat": "Sent",
          "metric": "network",
          "refId": "B",
          "step": 10
        }
      ],
      "thresholds": [],
      "timeRegions": [],
      "title": "Network I/O pressure",
      "tooltip": {
        "msResolution": false,
        "shared": true,
        "sort": 0,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "Bps",
          "logBase": 1,
          "show": true
        },
        {
          "format": "Bps",
          "logBase": 1,
          "show": false
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "collapsed": false,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 7
      },
      "id": 34,
      "panels": [],
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "refId": "A"
        }
      ],
      "title": "Total usage",
      "type": "row"
    },
    {
      "datasource": {
        "uid": "$datasource"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "max": 100,
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "rgba(50, 172, 45, 0.97)",
                "value": null
              },
              {
                "color": "rgba(237, 129, 40, 0.89)",
                "value": 65
              },
              {
                "color": "rgba(245, 54, 54, 0.9)",
                "value": 90
              }
            ]
          },
          "unit": "percent"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 5,
        "w": 8,
        "x": 0,
        "y": 8
      },
      "id": 4,
      "links": [],
      "maxDataPoints": 100,
      "options": {
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true
      },
      "pluginVersion": "9.3.1",
      "targets": [
        {
          "datasource": {
            "uid": "$datasource"
          },
          "expr": "sum (container_memory_working_set_bytes{id=\"/\",kubernetes_io_hostname=~\"^$Node$\"}) / sum (machine_memory_bytes{kubernetes_io_hostname=~\"^$Node$\"}) * 100",
          "format": "time_series",
          "interval": "10s",
          "intervalFactor": 1,
          "refId": "A",
          "step": 10
        }
      ],
      "title": "Cluster memory usage",
      "type": "gauge"
    },
    {
      "datasource": {
        "uid": "$datasource"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "decimals": 2,
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "max": 100,
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "rgba(50, 172, 45, 0.97)",
                "value": null
              },
              {
                "color": "rgba(237, 129, 40, 0.89)",
                "value": 65
              },
              {
                "color": "rgba(245, 54, 54, 0.9)",
                "value": 90
              }
            ]
          },
          "unit": "percent"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 5,
        "w": 8,
        "x": 8,
        "y": 8
      },
      "id": 6,
      "links": [],
      "maxDataPoints": 100,
      "options": {
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true
      },
      "pluginVersion": "9.3.1",
      "targets": [
        {
          "datasource": {
            "uid": "$datasource"
          },
          "expr": "sum (rate (container_cpu_usage_seconds_total{id=\"/\",kubernetes_io_hostname=~\"^$Node$\"}[$interval])) / sum (machine_cpu_cores{kubernetes_io_hostname=~\"^$Node$\"}) * 100",
          "format": "time_series",
          "interval": "10s",
          "intervalFactor": 1,
          "legendFormat": "",
          "refId": "A",
          "step": 10
        }
      ],
      "title": "Cluster CPU usage ($interval avg)",
      "type": "gauge"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "$datasource"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "decimals": 2,
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "max": 100,
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "rgba(50, 172, 45, 0.97)",
                "value": null
              },
              {
                "color": "rgba(237, 129, 40, 0.89)",
                "value": 65
              },
              {
                "color": "rgba(245, 54, 54, 0.9)",
                "value": 90
              }
            ]
          },
          "unit": "percent"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 5,
        "w": 8,
        "x": 16,
        "y": 8
      },
      "id": 7,
      "links": [],
      "maxDataPoints": 100,
      "options": {
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true
      },
      "pluginVersion": "9.3.1",
      "targets": [
        {
          "datasource": {
            "uid": "$datasource"
          },
          "editorMode": "code",
          "expr": "sum (container_fs_usage_bytes{device=~\"/dev/nvme.{5}\",id=\"/\",kubernetes_io_hostname=~\"^$Node$\"}) / sum (container_fs_limit_bytes{device=~\"^/dev/nvme.{5}\",id=\"/\",kubernetes_io_hostname=~\"^$Node$\"}) * 100",
          "format": "time_series",
          "interval": "10s",
          "intervalFactor": 1,
          "legendFormat": "",
          "metric": "",
          "range": true,
          "refId": "A",
          "step": 10
        }
      ],
      "title": "Cluster filesystem usage",
      "type": "gauge"
    },
    {
      "datasource": {
        "uid": "$datasource"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "decimals": 2,
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "bytes"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 3,
        "w": 4,
        "x": 0,
        "y": 13
      },
      "id": 9,
      "links": [],
      "maxDataPoints": 100,
      "options": {
        "colorMode": "none",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "textMode": "auto"
      },
      "pluginVersion": "9.3.1",
      "targets": [
        {
          "datasource": {
            "uid": "$datasource"
          },
          "expr": "sum (container_memory_working_set_bytes{id=\"/\",kubernetes_io_hostname=~\"^$Node$\"})",
          "format": "time_series",
          "interval": "10s",
          "intervalFactor": 1,
          "refId": "A",
          "step": 10
        }
      ],
      "title": "Used",
      "type": "stat"
    },
    {
      "datasource": {
        "uid": "$datasource"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "decimals": 2,
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "bytes"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 3,
        "w": 4,
        "x": 4,
        "y": 13
      },
      "id": 10,
      "links": [],
      "maxDataPoints": 100,
      "options": {
        "colorMode": "none",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "textMode": "auto"
      },
      "pluginVersion": "9.3.1",
      "targets": [
        {
          "datasource": {
            "uid": "$datasource"
          },
          "expr": "sum (machine_memory_bytes{kubernetes_io_hostname=~\"^$Node$\"})",
          "format": "time_series",
          "interval": "10s",
          "intervalFactor": 1,
          "refId": "A",
          "step": 10
        }
      ],
      "title": "Total",
      "type": "stat"
    },
    {
      "datasource": {
        "uid": "$datasource"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "decimals": 2,
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "none"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 3,
        "w": 4,
        "x": 8,
        "y": 13
      },
      "id": 11,
      "links": [],
      "maxDataPoints": 100,
      "options": {
        "colorMode": "none",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "textMode": "auto"
      },
      "pluginVersion": "9.3.1",
      "targets": [
        {
          "datasource": {
            "uid": "$datasource"
          },
          "expr": "sum (rate (container_cpu_usage_seconds_total{id=\"/\",kubernetes_io_hostname=~\"^$Node$\"}[$interval]))",
          "format": "time_series",
          "interval": "10s",
          "intervalFactor": 1,
          "legendFormat": "",
          "refId": "A",
          "step": 10
        }
      ],
      "title": "Used",
      "type": "stat"
    },
    {
      "datasource": {
        "uid": "$datasource"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "decimals": 2,
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "none"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 3,
        "w": 4,
        "x": 12,
        "y": 13
      },
      "id": 12,
      "links": [],
      "maxDataPoints": 100,
      "options": {
        "colorMode": "none",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "textMode": "auto"
      },
      "pluginVersion": "9.3.1",
      "targets": [
        {
          "datasource": {
            "uid": "$datasource"
          },
          "expr": "sum (machine_cpu_cores{kubernetes_io_hostname=~\"^$Node$\"})",
          "format": "time_series",
          "interval": "10s",
          "intervalFactor": 1,
          "refId": "A",
          "step": 10
        }
      ],
      "title": "Total",
      "type": "stat"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "$datasource"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "decimals": 2,
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "bytes"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 3,
        "w": 4,
        "x": 16,
        "y": 13
      },
      "id": 13,
      "links": [],
      "maxDataPoints": 100,
      "options": {
        "colorMode": "none",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "textMode": "auto"
      },
      "pluginVersion": "9.3.1",
      "targets": [
        {
          "datasource": {
            "uid": "$datasource"
          },
          "editorMode": "code",
          "expr": "sum (container_fs_usage_bytes{device=~\"^/dev/nvme.{5}\",id=\"/\",kubernetes_io_hostname=~\"^$Node$\"})",
          "format": "time_series",
          "interval": "10s",
          "intervalFactor": 1,
          "legendFormat": "",
          "range": true,
          "refId": "A",
          "step": 10
        }
      ],
      "title": "Used",
      "type": "stat"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "$datasource"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "decimals": 2,
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "bytes"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 3,
        "w": 4,
        "x": 20,
        "y": 13
      },
      "id": 14,
      "links": [],
      "maxDataPoints": 100,
      "options": {
        "colorMode": "none",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "textMode": "auto"
      },
      "pluginVersion": "9.3.1",
      "targets": [
        {
          "datasource": {
            "uid": "$datasource"
          },
          "editorMode": "code",
          "expr": "sum (container_fs_limit_bytes{device=~\"^/dev/nvme.{5}\",id=\"/\",kubernetes_io_hostname=~\"^$Node$\"})",
          "format": "time_series",
          "interval": "10s",
          "intervalFactor": 1,
          "legendFormat": "",
          "range": true,
          "refId": "A",
          "step": 10
        }
      ],
      "title": "Total",
      "type": "stat"
    },
    {
      "collapsed": false,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 16
      },
      "id": 35,
      "panels": [],
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "refId": "A"
        }
      ],
      "title": "Pods CPU usage",
      "type": "row"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "$datasource"
      },
      "decimals": 3,
      "editable": true,
      "error": false,
      "fill": 0,
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 17
      },
      "height": "",
      "hiddenSeries": false,
      "id": 17,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": false,
        "min": false,
        "rightSide": true,
        "show": true,
        "sort": "current",
        "sortDesc": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 2,
      "links": [],
      "nullPointMode": "connected",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "9.3.1",
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": true,
      "targets": [
        {
          "datasource": {
            "uid": "$datasource"
          },
          "editorMode": "code",
          "expr": "sum (rate (container_cpu_usage_seconds_total{image!=\"\",name=~\"^.*\",kubernetes_io_hostname=~\"^$Node$\"}[$interval])) by (pod_name)",
          "format": "time_series",
          "interval": "10s",
          "intervalFactor": 1,
          "legendFormat": "{{ pod_name }}",
          "metric": "container_cpu",
          "range": true,
          "refId": "A",
          "step": 10
        }
      ],
      "thresholds": [],
      "timeRegions": [],
      "title": "Pods CPU usage ($interval avg)",
      "tooltip": {
        "msResolution": true,
        "shared": true,
        "sort": 2,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "none",
          "label": "cores",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": false
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "collapsed": true,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 24
      },
      "id": 36,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "uid": "$datasource"
          },
          "decimals": 3,
          "editable": true,
          "error": false,
          "fill": 0,
          "grid": {},
          "gridPos": {
            "h": 7,
            "w": 24,
            "x": 0,
            "y": 24
          },
          "height": "",
          "id": 23,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": false,
            "min": false,
            "rightSide": true,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "nullPointMode": "connected",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": true,
          "targets": [
            {
              "datasource": {
                "uid": "$datasource"
              },
              "expr": "sum (rate (container_cpu_usage_seconds_total{kubernetes_io_role=\"master\",pod_name!=\"\",kubernetes_io_hostname=~\"^$Node$\"}[$interval])) by (container_name)",
              "format": "time_series",
              "hide": false,
              "interval": "10s",
              "intervalFactor": 1,
              "legendFormat": "{{ container_name }}",
              "metric": "container_cpu",
              "refId": "A",
              "step": 10
            }
          ],
          "thresholds": [],
          "title": "System services CPU usage ($interval avg)",
          "tooltip": {
            "msResolution": true,
            "shared": true,
            "sort": 2,
            "value_type": "cumulative"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "none",
              "label": "cores",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ]
        }
      ],
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "refId": "A"
        }
      ],
      "title": "System services CPU usage",
      "type": "row"
    },
    {
      "collapsed": false,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 25
      },
      "id": 37,
      "panels": [],
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "refId": "A"
        }
      ],
      "title": "Containers CPU usage",
      "type": "row"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "uid": "$datasource"
      },
      "decimals": 3,
      "editable": true,
      "error": false,
      "fill": 0,
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 26
      },
      "height": "",
      "hiddenSeries": false,
      "id": 24,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "hideEmpty": false,
        "hideZero": false,
        "max": false,
        "min": false,
        "rightSide": true,
        "show": true,
        "sort": "current",
        "sortDesc": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 2,
      "links": [],
      "nullPointMode": "connected",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "9.3.1",
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": true,
      "targets": [
        {
          "datasource": {
            "uid": "$datasource"
          },
          "expr": "sum (rate (container_cpu_usage_seconds_total{image!=\"\",name=~\"^k8s_.*\",container_name!=\"POD\",kubernetes_io_hostname=~\"^$Node$\"}[$interval])) by (container_name, pod_name)",
          "format": "time_series",
          "hide": false,
          "interval": "10s",
          "intervalFactor": 1,
          "legendFormat": "pod: {{ pod_name }} | {{ container_name }}",
          "metric": "container_cpu",
          "refId": "A",
          "step": 10
        },
        {
          "datasource": {
            "uid": "$datasource"
          },
          "expr": "sum (rate (container_cpu_usage_seconds_total{image!=\"\",name!~\"^k8s_.*\",kubernetes_io_hostname=~\"^$Node$\"}[$interval])) by (kubernetes_io_hostname, name, image)",
          "format": "time_series",
          "hide": false,
          "interval": "10s",
          "intervalFactor": 1,
          "legendFormat": "docker: {{ kubernetes_io_hostname }} | {{ image }} ({{ name }})",
          "metric": "container_cpu",
          "refId": "B",
          "step": 10
        },
        {
          "datasource": {
            "uid": "$datasource"
          },
          "expr": "sum (rate (container_cpu_usage_seconds_total{rkt_container_name!=\"\",kubernetes_io_hostname=~\"^$Node$\"}[$interval])) by (kubernetes_io_hostname, rkt_container_name)",
          "format": "time_series",
          "interval": "10s",
          "intervalFactor": 1,
          "legendFormat": "rkt: {{ kubernetes_io_hostname }} | {{ rkt_container_name }}",
          "metric": "container_cpu",
          "refId": "C",
          "step": 10
        }
      ],
      "thresholds": [],
      "timeRegions": [],
      "title": "Containers CPU usage ($interval avg)",
      "tooltip": {
        "msResolution": true,
        "shared": true,
        "sort": 2,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "none",
          "label": "cores",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": false
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "collapsed": false,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 33
      },
      "id": 38,
      "panels": [],
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "refId": "A"
        }
      ],
      "title": "All processes CPU usage",
      "type": "row"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "uid": "$datasource"
      },
      "decimals": 3,
      "editable": true,
      "error": false,
      "fill": 0,
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 14,
        "w": 24,
        "x": 0,
        "y": 34
      },
      "hiddenSeries": false,
      "id": 20,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": false,
        "min": false,
        "rightSide": false,
        "show": true,
        "sort": "current",
        "sortDesc": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 2,
      "links": [],
      "nullPointMode": "connected",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "9.3.1",
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": true,
      "targets": [
        {
          "datasource": {
            "uid": "$datasource"
          },
          "expr": "sum (rate (container_cpu_usage_seconds_total{id!=\"/\",kubernetes_io_hostname=~\"^$Node$\"}[$interval])) by (id)",
          "format": "time_series",
          "hide": false,
          "interval": "10s",
          "intervalFactor": 1,
          "legendFormat": "{{ id }}",
          "metric": "container_cpu",
          "refId": "A",
          "step": 10
        }
      ],
      "thresholds": [],
      "timeRegions": [],
      "title": "All processes CPU usage ($interval avg)",
      "tooltip": {
        "msResolution": true,
        "shared": true,
        "sort": 2,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "none",
          "label": "cores",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": false
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "collapsed": false,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 48
      },
      "id": 39,
      "panels": [],
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "refId": "A"
        }
      ],
      "title": "Pods memory usage",
      "type": "row"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "$datasource"
      },
      "decimals": 2,
      "editable": true,
      "error": false,
      "fill": 0,
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 49
      },
      "hiddenSeries": false,
      "id": 25,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": false,
        "min": false,
        "rightSide": true,
        "show": true,
        "sideWidth": 200,
        "sort": "current",
        "sortDesc": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 2,
      "links": [],
      "nullPointMode": "connected",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "9.3.1",
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": true,
      "targets": [
        {
          "datasource": {
            "uid": "$datasource"
          },
          "editorMode": "code",
          "expr": "sum (container_memory_working_set_bytes{image!=\"\",name=~\"^.*\",kubernetes_io_hostname=~\"^$Node$\"}) by (pod_name)",
          "format": "time_series",
          "interval": "10s",
          "intervalFactor": 1,
          "legendFormat": "{{ pod_name }}",
          "metric": "container_memory_usage:sort_desc",
          "range": true,
          "refId": "A",
          "step": 10
        }
      ],
      "thresholds": [],
      "timeRegions": [],
      "title": "Pods memory usage",
      "tooltip": {
        "msResolution": false,
        "shared": true,
        "sort": 2,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "bytes",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": false
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "collapsed": false,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 56
      },
      "id": 40,
      "panels": [],
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "refId": "A"
        }
      ],
      "title": "System services memory usage",
      "type": "row"
    },
    {
      "collapsed": false,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 57
      },
      "id": 41,
      "panels": [],
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "refId": "A"
        }
      ],
      "title": "Containers memory usage",
      "type": "row"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "uid": "$datasource"
      },
      "decimals": 2,
      "editable": true,
      "error": false,
      "fill": 0,
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 58
      },
      "hiddenSeries": false,
      "id": 27,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": false,
        "min": false,
        "rightSide": true,
        "show": true,
        "sideWidth": 200,
        "sort": "current",
        "sortDesc": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 2,
      "links": [],
      "nullPointMode": "connected",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "9.3.1",
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": true,
      "targets": [
        {
          "datasource": {
            "uid": "$datasource"
          },
          "expr": "sum (container_memory_working_set_bytes{image!=\"\",name=~\"^k8s_.*\",container_name!=\"POD\",kubernetes_io_hostname=~\"^$Node$\"}) by (container_name, pod_name)",
          "format": "time_series",
          "interval": "10s",
          "intervalFactor": 1,
          "legendFormat": "pod: {{ pod_name }} | {{ container_name }}",
          "metric": "container_memory_usage:sort_desc",
          "refId": "A",
          "step": 10
        },
        {
          "datasource": {
            "uid": "$datasource"
          },
          "expr": "sum (container_memory_working_set_bytes{image!=\"\",name!~\"^k8s_.*\",kubernetes_io_hostname=~\"^$Node$\"}) by (kubernetes_io_hostname, name, image)",
          "format": "time_series",
          "interval": "10s",
          "intervalFactor": 1,
          "legendFormat": "docker: {{ kubernetes_io_hostname }} | {{ image }} ({{ name }})",
          "metric": "container_memory_usage:sort_desc",
          "refId": "B",
          "step": 10
        },
        {
          "datasource": {
            "uid": "$datasource"
          },
          "expr": "sum (container_memory_working_set_bytes{rkt_container_name!=\"\",kubernetes_io_hostname=~\"^$Node$\"}) by (kubernetes_io_hostname, rkt_container_name)",
          "format": "time_series",
          "interval": "10s",
          "intervalFactor": 1,
          "legendFormat": "rkt: {{ kubernetes_io_hostname }} | {{ rkt_container_name }}",
          "metric": "container_memory_usage:sort_desc",
          "refId": "C",
          "step": 10
        }
      ],
      "thresholds": [],
      "timeRegions": [],
      "title": "Containers memory usage",
      "tooltip": {
        "msResolution": false,
        "shared": true,
        "sort": 2,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "bytes",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": false
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "collapsed": false,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 65
      },
      "id": 42,
      "panels": [],
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "refId": "A"
        }
      ],
      "title": "All processes memory usage",
      "type": "row"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "uid": "$datasource"
      },
      "decimals": 2,
      "editable": true,
      "error": false,
      "fill": 0,
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 14,
        "w": 24,
        "x": 0,
        "y": 66
      },
      "hiddenSeries": false,
      "id": 28,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": false,
        "min": false,
        "rightSide": false,
        "show": true,
        "sideWidth": 200,
        "sort": "current",
        "sortDesc": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 2,
      "links": [],
      "nullPointMode": "connected",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "9.3.1",
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": true,
      "targets": [
        {
          "datasource": {
            "uid": "$datasource"
          },
          "expr": "sum (container_memory_working_set_bytes{id!=\"/\",kubernetes_io_hostname=~\"^$Node$\"}) by (id)",
          "format": "time_series",
          "interval": "10s",
          "intervalFactor": 1,
          "legendFormat": "{{ id }}",
          "metric": "container_memory_usage:sort_desc",
          "refId": "A",
          "step": 10
        }
      ],
      "thresholds": [],
      "timeRegions": [],
      "title": "All processes memory usage",
      "tooltip": {
        "msResolution": false,
        "shared": true,
        "sort": 2,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "bytes",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": false
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "collapsed": false,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 80
      },
      "id": 43,
      "panels": [],
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "refId": "A"
        }
      ],
      "title": "Pods network I/O",
      "type": "row"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "$datasource"
      },
      "decimals": 2,
      "editable": true,
      "error": false,
      "fill": 1,
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 81
      },
      "hiddenSeries": false,
      "id": 16,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": false,
        "min": false,
        "rightSide": true,
        "show": true,
        "sideWidth": 200,
        "sort": "current",
        "sortDesc": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 2,
      "links": [],
      "nullPointMode": "connected",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "9.3.1",
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "datasource": {
            "uid": "$datasource"
          },
          "editorMode": "code",
          "expr": "sum (rate (container_network_receive_bytes_total{image!=\"\",name=~\"^.*\",kubernetes_io_hostname=~\"^$Node$\"}[$interval])) by (pod_name)",
          "format": "time_series",
          "interval": "10s",
          "intervalFactor": 1,
          "legendFormat": "-> {{ pod_name }}",
          "metric": "network",
          "range": true,
          "refId": "A",
          "step": 10
        },
        {
          "datasource": {
            "uid": "$datasource"
          },
          "expr": "- sum (rate (container_network_transmit_bytes_total{image!=\"\",name=~\"^k8s_.*\",kubernetes_io_hostname=~\"^$Node$\"}[$interval])) by (pod_name)",
          "format": "time_series",
          "interval": "10s",
          "intervalFactor": 1,
          "legendFormat": "<- {{ pod_name }}",
          "metric": "network",
          "refId": "B",
          "step": 10
        }
      ],
      "thresholds": [],
      "timeRegions": [],
      "title": "Pods network I/O ($interval avg)",
      "tooltip": {
        "msResolution": false,
        "shared": true,
        "sort": 2,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "Bps",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": false
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "collapsed": false,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 88
      },
      "id": 44,
      "panels": [],
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "refId": "A"
        }
      ],
      "title": "Containers network I/O",
      "type": "row"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "uid": "$datasource"
      },
      "decimals": 2,
      "editable": true,
      "error": false,
      "fill": 1,
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 89
      },
      "hiddenSeries": false,
      "id": 30,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": false,
        "min": false,
        "rightSide": true,
        "show": true,
        "sideWidth": 200,
        "sort": "current",
        "sortDesc": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 2,
      "links": [],
      "nullPointMode": "connected",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "9.3.1",
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "datasource": {
            "uid": "$datasource"
          },
          "expr": "sum (rate (container_network_receive_bytes_total{image!=\"\",name=~\"^k8s_.*\",kubernetes_io_hostname=~\"^$Node$\"}[$interval])) by (container_name, pod_name)",
          "format": "time_series",
          "hide": false,
          "interval": "10s",
          "intervalFactor": 1,
          "legendFormat": "-> pod: {{ pod_name }} | {{ container_name }}",
          "metric": "network",
          "refId": "B",
          "step": 10
        },
        {
          "datasource": {
            "uid": "$datasource"
          },
          "expr": "- sum (rate (container_network_transmit_bytes_total{image!=\"\",name=~\"^k8s_.*\",kubernetes_io_hostname=~\"^$Node$\"}[$interval])) by (container_name, pod_name)",
          "format": "time_series",
          "hide": false,
          "interval": "10s",
          "intervalFactor": 1,
          "legendFormat": "<- pod: {{ pod_name }} | {{ container_name }}",
          "metric": "network",
          "refId": "D",
          "step": 10
        },
        {
          "datasource": {
            "uid": "$datasource"
          },
          "expr": "sum (rate (container_network_receive_bytes_total{image!=\"\",name!~\"^k8s_.*\",kubernetes_io_hostname=~\"^$Node$\"}[$interval])) by (kubernetes_io_hostname, name, image)",
          "format": "time_series",
          "hide": false,
          "interval": "10s",
          "intervalFactor": 1,
          "legendFormat": "-> docker: {{ kubernetes_io_hostname }} | {{ image }} ({{ name }})",
          "metric": "network",
          "refId": "A",
          "step": 10
        },
        {
          "datasource": {
            "uid": "$datasource"
          },
          "expr": "- sum (rate (container_network_transmit_bytes_total{image!=\"\",name!~\"^k8s_.*\",kubernetes_io_hostname=~\"^$Node$\"}[$interval])) by (kubernetes_io_hostname, name, image)",
          "format": "time_series",
          "hide": false,
          "interval": "10s",
          "intervalFactor": 1,
          "legendFormat": "<- docker: {{ kubernetes_io_hostname }} | {{ image }} ({{ name }})",
          "metric": "network",
          "refId": "C",
          "step": 10
        },
        {
          "datasource": {
            "uid": "$datasource"
          },
          "expr": "sum (rate (container_network_transmit_bytes_total{rkt_container_name!=\"\",kubernetes_io_hostname=~\"^$Node$\"}[$interval])) by (kubernetes_io_hostname, rkt_container_name)",
          "format": "time_series",
          "hide": false,
          "interval": "10s",
          "intervalFactor": 1,
          "legendFormat": "-> rkt: {{ kubernetes_io_hostname }} | {{ rkt_container_name }}",
          "metric": "network",
          "refId": "E",
          "step": 10
        },
        {
          "datasource": {
            "uid": "$datasource"
          },
          "expr": "- sum (rate (container_network_transmit_bytes_total{rkt_container_name!=\"\",kubernetes_io_hostname=~\"^$Node$\"}[$interval])) by (kubernetes_io_hostname, rkt_container_name)",
          "format": "time_series",
          "hide": false,
          "interval": "10s",
          "intervalFactor": 1,
          "legendFormat": "<- rkt: {{ kubernetes_io_hostname }} | {{ rkt_container_name }}",
          "metric": "network",
          "refId": "F",
          "step": 10
        }
      ],
      "thresholds": [],
      "timeRegions": [],
      "title": "Containers network I/O ($interval avg)",
      "tooltip": {
        "msResolution": false,
        "shared": true,
        "sort": 2,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "Bps",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": false
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "collapsed": false,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 96
      },
      "id": 45,
      "panels": [],
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "refId": "A"
        }
      ],
      "title": "All processes network I/O",
      "type": "row"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "uid": "$datasource"
      },
      "decimals": 2,
      "editable": true,
      "error": false,
      "fill": 1,
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 14,
        "w": 24,
        "x": 0,
        "y": 97
      },
      "hiddenSeries": false,
      "id": 29,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": false,
        "min": false,
        "rightSide": false,
        "show": true,
        "sideWidth": 200,
        "sort": "current",
        "sortDesc": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 2,
      "links": [],
      "nullPointMode": "connected",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "9.3.1",
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "datasource": {
            "uid": "$datasource"
          },
          "expr": "sum (rate (container_network_receive_bytes_total{id!=\"/\",kubernetes_io_hostname=~\"^$Node$\"}[$interval])) by (id)",
          "format": "time_series",
          "interval": "10s",
          "intervalFactor": 1,
          "legendFormat": "-> {{ id }}",
          "metric": "network",
          "refId": "A",
          "step": 10
        },
        {
          "datasource": {
            "uid": "$datasource"
          },
          "expr": "- sum (rate (container_network_transmit_bytes_total{id!=\"/\",kubernetes_io_hostname=~\"^$Node$\"}[$interval])) by (id)",
          "format": "time_series",
          "interval": "10s",
          "intervalFactor": 1,
          "legendFormat": "<- {{ id }}",
          "metric": "network",
          "refId": "B",
          "step": 10
        }
      ],
      "thresholds": [],
      "timeRegions": [],
      "title": "All processes network I/O ($interval avg)",
      "tooltip": {
        "msResolution": false,
        "shared": true,
        "sort": 2,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "Bps",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": false
        }
      ],
      "yaxis": {
        "align": false
      }
    }
  ],
  "refresh": "10s",
  "schemaVersion": 37,
  "style": "dark",
  "tags": [
    "prometheus"
  ],
  "templating": {
    "list": [
      {
        "auto": true,
        "auto_count": 20,
        "auto_min": "2m",
        "current": {
          "selected": false,
          "text": "auto",
          "value": "$__auto_interval_interval"
        },
        "hide": 2,
        "name": "interval",
        "options": [
          {
            "selected": true,
            "text": "auto",
            "value": "$__auto_interval_interval"
          },
          {
            "selected": false,
            "text": "1m",
            "value": "1m"
          },
          {
            "selected": false,
            "text": "10m",
            "value": "10m"
          },
          {
            "selected": false,
            "text": "30m",
            "value": "30m"
          },
          {
            "selected": false,
            "text": "1h",
            "value": "1h"
          },
          {
            "selected": false,
            "text": "6h",
            "value": "6h"
          },
          {
            "selected": false,
            "text": "12h",
            "value": "12h"
          },
          {
            "selected": false,
            "text": "1d",
            "value": "1d"
          },
          {
            "selected": false,
            "text": "7d",
            "value": "7d"
          },
          {
            "selected": false,
            "text": "14d",
            "value": "14d"
          },
          {
            "selected": false,
            "text": "30d",
            "value": "30d"
          }
        ],
        "query": "1m,10m,30m,1h,6h,12h,1d,7d,14d,30d",
        "refresh": 2,
        "skipUrlSync": false,
        "type": "interval"
      },
      {
        "current": {
          "selected": false,
          "text": "Prometheus",
          "value": "Prometheus"
        },
        "hide": 0,
        "includeAll": false,
        "multi": false,
        "name": "datasource",
        "options": [],
        "query": "prometheus",
        "queryValue": "",
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "type": "datasource"
      },
      {
        "allValue": ".*",
        "current": {
          "selected": false,
          "text": "All",
          "value": "$__all"
        },
        "datasource": {
          "type": "prometheus",
          "uid": "$datasource"
        },
        "definition": "",
        "hide": 0,
        "includeAll": true,
        "multi": false,
        "name": "Node",
        "options": [],
        "query": {
          "query": "label_values(kubernetes_io_hostname)",
          "refId": "Prometheus-Node-Variable-Query"
        },
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 0,
        "tagValuesQuery": "",
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      }
    ]
  },
  "time": {
    "from": "now-15m",
    "to": "now"
  },
  "timepicker": {
    "refresh_intervals": [
      "5s",
      "10s",
      "30s",
      "1m",
      "5m",
      "15m",
      "30m",
      "1h",
      "2h",
      "1d"
    ],
    "time_options": [
      "5m",
      "15m",
      "1h",
      "6h",
      "12h",
      "24h",
      "2d",
      "7d",
      "30d"
    ]
  },
  "timezone": "browser",
  "title": "Kubernetes cluster monitoring",
  "uid": "sWOJoxp4k",
  "version": 1,
  "weekStart": ""
}