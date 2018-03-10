# bluetooth

This project is a try at Bluez C binding with Crystal

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  bluetooth:
    github: bararchy/bluetooth
```

## Usage

```crystal
require "bluetooth"
local_device = Bluetooth::LocalDevice.new
remote_devices = local_device.scan
local_device.close

# remote_devices is a Hash(String, String) of address => name
p remote_devices
=> {
  "00:11:22:33:FF:EE" => "Android Phone"
}

```


## Development

* [ ] Bluetooth  
  * [x] Scan for remote devices.  
  * [ ] Connect to remote devices.  
  * [ ] Enumarate services.  
  * [ ] Handle different services like media, sounds, etc..  
* [ ] BLE  
  * [ ] Scan for remote devices.  
  * [ ] Connect to remote devices.  
  * [ ] Enumarate services.  
  * [ ] Send commands to remote services.  

## Contributing

1. Fork it ( https://github.com/bararchy/bluetooth/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [bararchy(https://github.com/bararchy) Bar Hofesh - creator, maintainer
