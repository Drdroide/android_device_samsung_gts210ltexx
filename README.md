## TWRP device tree for Samsung Galaxy Tab S2 9.7 (LTE)
## gts210ltexx

Add to `.repo/local_manifests/gts210ltexx.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project name="ripee/android_device_samsung_gts210ltexx" path="device/samsung/gts210ltexx" remote="github" revision="android-7.1" />
</manifest>
```

Then run `repo sync` to check it out.

To build:

```sh
. build/envsetup.sh
lunch omni_gts210ltexx-eng
mka recoveryimage
```

