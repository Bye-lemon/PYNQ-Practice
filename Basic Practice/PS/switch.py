from pynq.overlays.base import BaseOverlay
import time

# Define Relational Mapping
mapping = {
    '00': 0,
    '01': 1,
    '10': 2,
    '11': 3
}

def getstatus(sw0, sw1):
    return str(sw0.read()) + str(sw1.read())

print("Loading Overlay...")
base = BaseOverlay("base.bit")
sw0 = base.switches[0]
sw1 = base.switches[1]
print("Runing Command...")
for foo in range(5):
    led = base.leds[mapping.get(getstatus(sw0, sw1))]
    led.toggle()
    time.sleep(1)
    led.toggle()
    time.sleep(1)
    
