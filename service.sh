#AAudio & MMAP
resetprop -n aaudio.mmap_policy 2
resetprop -n aaudio.mmap_exclusive_policy 2

#AudioHaL
resetprop -n audio_hal.period_size 192
resetprop -n audio_hal.in_period_size 192
resetprop -n audio_hal.period_multiplier 3
resetprop -n audio.pp.asphere.enabled true
resetprop -n audio.playback.mch.downsample false
resetprop -n av.offload.enable true
resetprop -n flac.sw.decoder.24bit.support true

#Offload services
resetprop -n audio.offload.disable false
resetprop -n audio.offload.pcm.enable true
resetprop -n audio.offload.track.enable true
resetprop -n audio.offload.passthrough false
resetprop -n audio.offload.buffer.size.kb 32
resetprop -n audio.offload.gapless.enabled true
resetprop -n audio.offload.multiple.enabled true
resetprop -n audio.offload.multiaac.enable true
resetprop -n audio.offload.pcm.16bit.enabled true
resetprop -n audio.offload.pcm.24bit.enabled true
resetprop -n audio.offload.pcm.32bit.enabled true

#Wait for boot to finish completely
dbg "Sleeping until boot completes."
while [[ `getprop sys.boot_completed` -ne 1 ]]
do
       sleep 1
done

# Sleep an additional 40s to ensure init is finished
sleep 40

killall audioserver
