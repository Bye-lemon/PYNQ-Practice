from pynq import GPIO, Overlay
from time import sleep

# Load Overlay
overlay = Overlay("traffic.bit")

# LED Define
RED    = 1, 0, 0
GREEN  = 0, 1, 0
YELLOW = 1, 1, 0 

class LED:
    def __init__(self, r, g, b):
        self.r = GPIO(GPIO.get_gpio_pin(r), 'out')
        self.g = GPIO(GPIO.get_gpio_pin(g), 'out')
        self.b = GPIO(GPIO.get_gpio_pin(b), 'out')
    
    def write(self, color):
        self.r.write(color[0])
        self.g.write(color[1])
        self.b.write(color[2])
        
    def on(self):
        color = 1, 1, 1
        self.write(color)
        
    def off(self):
        color = 0, 0, 0
        self.write(color)
        
if __name__ == "__main__":
    t = 0
    led0 = LED(5, 4, 3)
    led1 = LED(2, 1, 0) 
    
    while True:
        if 0 <= t < 8:
            led0.write(RED)
            led1.write(GREEN)
        elif 8 <= t < 10:
            led0.write(RED)
            led1.write(YELLOW)
        elif 10 <= t < 18:
            led0.write(GREEN)
            led1.write(RED)
        elif 18 <= t < 20:
            led0.write(YELLOW)
            led1.write(RED)
        else:
            led0.write(YELLOW)
            led1.write(YELLOW)
        
        sleep(1)
        t += 1
        if t >= 20:
            t = 0