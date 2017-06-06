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
