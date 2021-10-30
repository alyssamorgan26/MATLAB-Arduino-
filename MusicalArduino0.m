clear; close all; clc;
% Alyssa Morgan
% October 1 2020
% When you press a colored button (Red, Green, or Yellow)
% the light that corresponds with the 
% button color lights up and blinks 5 times. It is followed by a buzz 
% sound. Each button had a different buzz pitch sound.
button_arduino = arduino('/dev/cu.usbserial-D308G780','Uno');
button_pin = 'D8';
% buttonpin is red
button_pin2 = 'D9';
% buttonpin2 is yellow
button_pin3 = 'D10'
%button pin 3 is green
SPEAK_PIN = 'D12';
ledpin = 'D5';
% led pin is red
ledpin2 = 'D4';
% ledpin 2 is yellow
ledpin3 = 'D3';
%led pin 3 is green
while (1)
    button_state = readDigitalPin(button_arduino, button_pin);
    button_state2 = readDigitalPin(button_arduino, button_pin2)
    button_state3 = readDigitalPin(button_arduino, button_pin3)
            
           
    if button_state == 1
        for iteration = 1:5
            writeDigitalPin(button_arduino,ledpin,1)
            pause(0.25)
            writeDigitalPin(button_arduino,ledpin,0)
        end
        
        while(button_state == 1)
            playTone(button_arduino, SPEAK_PIN, 440, 0.1);
        end
    end
    
    if button_state2 == 1
        for iteration = 1:5
            writeDigitalPin(button_arduino,ledpin2,1)
            pause(0.25)
            writeDigitalPin(button_arduino,ledpin2,0)
        end
        
        while(button_state2 == 1)
            playTone(button_arduino, SPEAK_PIN, 400, 0.1);
        end
    end
    
    if button_state3 == 1
        for iteration = 1;5
            writeDigitalPin(button_arduino,ledpin3,1)
            pause(0.25)
            writeDigitalPin(button_arduino,ledpin3,0)
        end
        
        while(button_state2 == 1)
            playTone(button_arduino, SPEAK_PIN, 300, 0.1);
        end 
    end
end
            


