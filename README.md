# Raspberry Pi Axis IP Camera Wall Display

I wanted to set up some Raspberry Pi boxes to provide a passive video feed
of the AXIS webcams I have set up at my house.  I hook these into unused
HDMI video inputs on my televisions and on a spare monitor to act as wall
displays for viewing the cameras.

This is really bare-bones and probably doesn't warrant public code, but 
none of this is well-documented and it took some experimenting to get it
all working.  Perhaps someone else will find it useful and be able to avoid
the hassles of figuring it out themselves.

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

Here are some other arguments that *may* work with the AXIS stream:

    resolution=160x120&compression=20&color=1&mirror=0&textcolor=white&textbackgroundcolor=black&textposition=top&text=0&clock=0&date=0&fps=0&audio=1&videokeyframeinterval=30&videobitrate=0&videocodec=h264
