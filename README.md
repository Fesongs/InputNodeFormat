# InputNodeFormat

### Issue
AVAudioEngine: audio input doesn't work on iOS17 simulator.

### Detail
`inputNode` has a 0ch 0kHz format. I cannot attach it to another node or install a tap on it. Otherwise it crashes with the following error:
```
Thread 1: "required condition is false: IsFormatSampleRateAndChannelCountValid(format)"
```

On iOS16 simulator, there is no issue. The `inputNode` format is valid, and there is no crash when I try to install a tap on it.

### Toy project
There is an Xcode toy project in this repo demonstrating the issue. It's a simple app instanciating an AVAudioEngine, setting AVAudioSession category to `.playAndRecord`, printing inputNode format and installing a tap on it. 

On iOS16 simulator, it's working well. On iOS17 simulator, it crashes systematically.

I tried to set the install tap audio format manually (both sample rate and channel count), no format seems to work.