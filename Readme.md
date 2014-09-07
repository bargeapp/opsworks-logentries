# Logentries Opsworks Cookbook
For amazon linux. Inspiration from https://github.com/MarkLC/le_chef and https://logentries.com/doc/agent/.

## Configuration
In stack settings set custom json like so:

```
"logentries": {
  "userkey": "[YOUR USER KEY]",
  "hostname": "[SOME NAME FOR SERVER]",
  "files": [
    "[/PATH/TO/FILE1]",
    "[/PATH/TO/FILE2]",
    "[/PATH/TO/FILE3]",
    ....
  ]
}
```