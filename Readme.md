# Logentries Opsworks Cookbook
Configures Opsworks to forward logs to Logentries (should work for other chef environments too though). Add to your Berksfile:

`cookbook 'logentries', github: 'bargeapp/opsworks-logentries', branch: "rsyslog"`

and then enable on the `setup` hook

## Configuration
In stack settings set custom json like so:

```
"logentries": {
  "[YOUR APPLICATION]": {
    token: "[TOKEN]",
    poll_seconds: 10,
    facility: 'local6'
    files: [
      {
        path: "/srv/www/website/current/log/development.log",
        tag: "website",
        state_file: "website-state",
        severity: "info",
        facility: "local6"
      }
    ]
  }
}
```

## Parameters

* `token` - log token (required)
* `poll_seconds` - how often to inspect files (optional, default: 10)
* `facility` - what facility to forward to logentries (optional, one of {local0, local1, local2..local7, *}, default: local6)
* `files` - list of files to forward to logentries
  * `path` - path of the file (required)
  * `tag` - tag to give entries from file (required)
  * `state_file` - file used to save position in log file (optional, default: #{tag}-state)
  * `severity` - severity to assign to items in log (optional, default: info)
  * `facility` - facility to log to (optional, one of {local0-local6})

  *note: file.facility should always equal facility unless facility is "\*" otherwise entries from that file will not be forwarded to logentries*