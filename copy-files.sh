#!/bin/sh

# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE=liberty
STAGESYS=~/cm6-$DEVICE/system

if [ "$1" = "pull" ]; then
  if [ -s "$STAGESYS" ]; then
  rm -R ~/cm6-$DEVICE
  fi
 mkdir ~/cm6-$DEVICE
 mkdir $STAGESYS
 mkdir $STAGESYS/bin
 mkdir $STAGESYS/lib
 mkdir $STAGESYS/etc
 adb pull /system/bin $STAGESYS/bin
 adb pull /system/lib $STAGESYS/lib
 adb pull /system/etc $STAGESYS/etc
fi

mkdir -p ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/bin/akmd ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/bin/wifitools ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/etc/AudioFilter.csv ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/etc/AudioPara4.csv ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/etc/AudioPara4_WB.csv ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/etc/AudioPreProcess.csv ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/etc/WPDB.zip ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/etc/firmware/yamato_pfp.fw ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/etc/firmware/yamato_pm4.fw ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/etc/pvasflocal.cfg ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/egl/libEGL_adreno200.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/egl/libGLESv1_CM_adreno200.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/egl/libGLESv2_adreno200.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/egl/libGLES_android.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libmm-adspsvc.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libOmxH264Dec.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libOmxMpeg4Dec.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libcamera.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libOmxVidEnc.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libgps.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libgsl.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libhtc_acoustic.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libaudioeq.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libhtc_ril.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/liboemcamera.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libomx_wmadec_sharedlibrary.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libomx_wmvdec_sharedlibrary.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libpvasfcommon.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libpvasflocalpb.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libpvasflocalpbreg.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libspeech.so ../../../vendor/htc/$DEVICE/proprietary

chmod 755 ../../../vendor/htc/$DEVICE/proprietary/akmd

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g > ../../../vendor/htc/$DEVICE/$DEVICE-vendor-blobs.mk
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is generated by device/htc/__DEVICE__/extract-files.sh

# Prebuilt libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES += \\
    vendor/htc/__DEVICE__/proprietary/libgps.so:obj/lib/libgps.so \\
    vendor/htc/__DEVICE__/proprietary/libcamera.so:obj/lib/libcamera.so
 
# All the blobs necessary for passion
PRODUCT_COPY_FILES += \\
    vendor/htc/__DEVICE__/proprietary/akmd:/system/bin/akmd \\
    vendor/htc/__DEVICE__/proprietary/wifitools:/system/bin/wifitools \\
    vendor/htc/__DEVICE__/proprietary/AudioFilter.csv:/system/etc/AudioFilter.csv \\
    vendor/htc/__DEVICE__/proprietary/AudioPara4.csv:/system/etc/AudioPara4.csv \\
    vendor/htc/__DEVICE__/proprietary/AudioPara4_WB.csv:/system/etc/AudioPara4_WB.csv \\
    vendor/htc/__DEVICE__/proprietary/AudioPreProcess.csv:/system/etc/AudioPreProcess.csv \\
    vendor/htc/__DEVICE__/proprietary/WPDB.zip:/system/etc/WPDB.zip \\
    vendor/htc/__DEVICE__/proprietary/yamato_pfp.fw:/system/etc/firmware/yamato_pfp.fw \\
    vendor/htc/__DEVICE__/proprietary/yamato_pm4.fw:/system/etc/firmware/yamato_pm4.fw \\
    vendor/htc/__DEVICE__/proprietary/pvasflocal.cfg:/system/etc/pvasflocal.cfg \\
    vendor/htc/__DEVICE__/proprietary/libEGL_adreno200.so:/system/lib/egl/libEGL_adreno200.so \\
    vendor/htc/__DEVICE__/proprietary/libGLESv1_CM_adreno200.so:/system/lib/egl/libGLESv1_CM_adreno200.so \\
    vendor/htc/__DEVICE__/proprietary/libGLESv2_adreno200.so:/system/lib/egl/libGLESv2_adreno200.so \\
    vendor/htc/__DEVICE__/proprietary/libGLES_android.so:/system/lib/egl/libGLES_android.so \\
    vendor/htc/__DEVICE__/proprietary/libmm-adspsvc.so:/system/lib/libmm-adspsvc.so \\
    vendor/htc/__DEVICE__/proprietary/libOmxH264Dec.so:/system/lib/libOmxH264Dec.so \\
    vendor/htc/__DEVICE__/proprietary/libOmxMpeg4Dec.so:/system/lib/libOmxMpeg4Dec.so \\
    vendor/htc/__DEVICE__/proprietary/libOmxVidEnc.so:/system/lib/libOmxVidEnc.so \\
    vendor/htc/__DEVICE__/proprietary/libcamera.so:/system/lib/libcamera.so \\
    vendor/htc/__DEVICE__/proprietary/libgps.so:/system/lib/libgps.so \\
    vendor/htc/__DEVICE__/proprietary/libgsl.so:/system/lib/libgsl.so \\
    vendor/htc/__DEVICE__/proprietary/libhtc_acoustic.so:/system/lib/libhtc_acoustic.so \\
    vendor/htc/__DEVICE__/proprietary/libaudioeq.so:/system/lib/libaudioeq.so \\
    vendor/htc/__DEVICE__/proprietary/libhtc_ril.so:/system/lib/libhtc_ril.so \\
    vendor/htc/__DEVICE__/proprietary/liboemcamera.so:/system/lib/liboemcamera.so \\
    vendor/htc/__DEVICE__/proprietary/libomx_wmadec_sharedlibrary.so:/system/lib/libomx_wmadec_sharedlibrary.so \\
    vendor/htc/__DEVICE__/proprietary/libomx_wmvdec_sharedlibrary.so:/system/lib/libomx_wmvdec_sharedlibrary.so \\
    vendor/htc/__DEVICE__/proprietary/libpvasfcommon.so:/system/lib/libpvasfcommon.so \\
    vendor/htc/__DEVICE__/proprietary/libpvasflocalpb.so:/system/lib/libpvasflocalpb.so \\
    vendor/htc/__DEVICE__/proprietary/libpvasflocalpbreg.so:/system/lib/libpvasflocalpbreg.so \\
    vendor/htc/__DEVICE__/proprietary/libspeech.so:/system/lib/libspeech.so 

EOF

./setup-makefiles.sh
