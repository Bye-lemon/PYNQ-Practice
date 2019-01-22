from pynq.overlays.base import BaseOverlay
import time

# Define LED Color Parameters
BLACK  = 0
BLUE   = 1
GREEN  = 2
CYAN   = 3
RED    = 4
PURPLE = 5
YELLOW = 6
WHITE  = 7

def foo(color):
    if not color in range(7):
        raise Exception("Invaild Color Parameter", str(color))

def blink(led, num):
    for sec in range(num):
        led.toggle()
        time.sleep(1)
		
def rgb_blink(rgbled, num, color):
    foo(color)
    for sec in range(num):
        rgbled.write(color if sec % 2 == 0 else BLACK)
        time.sleep(1)
		
if __name__ == "__main__":
    print("Loading Overlay...")
    base = BaseOverlay("base.bit")
    print("Running Command...")
    led = base.leds[0]
    rgbled = base.rgbleds[4]
    blink(led, 6)
    rgb_blink(rgbled, 6, CYAN)
    print("Finish.")
