from pynq.overlays.base import BaseOverlay
import time

print("Loading Overlay...")
base = BaseOverlay("base.bit")
print("Running Command...")
btn = base.buttons[0]
rgbled = base.rgbleds[4]
for foo in range(5):
    btn.wait_for_value(1)
    rgbled.write(5)
    btn.wait_for_value(0)
    rgbled.off()
