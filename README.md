# Fix finder progress indicator for macOS Catalina
In macOS Catalina there is no progress bar available when downloading IPSW to update iPhone. This simple bash script fixes this problem (Apple, why did you delete this feature? 😑)

## Prerequisites

* libimobiledevice
* cURL

## Usage
```
git clone https://github.com/sickmz/ipwsfix.git
cd ipswfix
chmod +x progress.sh
./progress.sh
```

## Output
```
Device name:     iPhone di Matteo
Product type:    iPhone11,6
Product version: 13.5
Build version:   17F75
iPSW path: ~/Library/iTunes/iPhone\ Software\ Updates

\ 2,3G / 5016,74 GB
```
