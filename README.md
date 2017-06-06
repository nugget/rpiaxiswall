# Raspberry Pi Axis IP Camera Wall Display

I wanted to set up some Raspberry Pi boxes to provide a passive video feed
of the [AXIS webcams] I have set up at my house.  I hook these into unused
HDMI video inputs on my televisions and on a spare monitor to act as wall
displays for viewing the cameras.

This is really bare-bones and probably doesn't warrant public code, but 
none of this is well-documented and it took some experimenting to get it
all working.  Perhaps someone else will find it useful and be able to avoid
the hassles of figuring it out themselves.

This script uses [omxplayer] to display the camera streams directly to the 
RPi's framebuffer so there's no need for X11 or a browser or any of that mess.
The h264 decoding is hardware-optimized for the RPi's GPU and is extremely
efficient.  I'm seeing a load average of 0.08% while decoding four independent
camera streams on an RPi 3.

    top - 14:59:31 up  2:17,  5 users,  load average: 0.07, 0.06, 0.08
    KiB Mem:    750640 total,   261288 used,   489352 free,    17568 buffers

      PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
    18239 root      20   0  135084  22608  14412 S   3.0  3.0   0:32.00 omxplayer.bin
    18238 root      20   0  134216  19272  14260 S   1.0  2.6   0:09.32 omxplayer.bin
    18242 root      20   0  132964  18892  14272 S   1.0  2.5   0:09.24 omxplayer.bin
    18235 root      20   0  132716  19820  14352 S   0.7  2.6   0:08.89 omxplayer.bin

## Requirements

- Developed and tested on a Pi 3 Model B running Raspbian Jesse Lite (no X11)
- I allocated the max memory possible to the GPU using `raspi-config`
- Tested with AXIS M3027, P1427-LE, and M2026-LE cameras.  Should work with
  any modern AXIS camera that can run firmware v5 or higher.

## Installation

- Copy the rpaw.conf.sample to rpaw.conf and edit to reflect your camera's
  viewer credentials.  This code currently only works if it's the same 
  username and password for all the cameras.

- Edit the `rpaw` bash script and add/remove/tweak the `rpaw-wrapper` calls
  towards the bottom to reflect your cameras and desired window arrangement.
  Yes, I realize this is lame and ugly, but it's ok for a version 0.1 release.

- Do a `sudo make install`

- This will create a `systemd` service called `rpaw` which can be enabled or
  disabled to taste.  It will respond to `start`, `stop`, and `status` 
  commands via `systemctl` as you'd expect/hope.
  

## Notes

- The AXIS username and password are exposed in the proctable (visible via `ps`)
  so it's inappropriate to use this on a machine that's shared by untrusted 
  users.  There doesn't appear to be a way to avoid this with [omxplayer]
  currently.  You could avoid it by enabling anonymous viewing on your
  cameras, but that's a horrible idea.

- Here are some other arguments that *may* work with the AXIS stream:
  `resolution=160x120&compression=20&color=1&mirror=0&textcolor=white&textbackgroundcolor=black&textposition=top&text=0&clock=0&date=0&fps=0&audio=1&videokeyframeinterval=30&videobitrate=0&videocodec=h264`

[AXIS webcams]: https://www.axis.com/us/en/products/network-cameras
[omxplayer]: https://github.com/popcornmix/omxplayer

