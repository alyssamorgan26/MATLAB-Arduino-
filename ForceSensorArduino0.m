% Alyssa Morgan
% October 1, 2020
% This program uses a force sensor on an arduino to sense how much
% weight is being applied and turns on the LED lights corresponding 
% to the force applied.
clear;
% Define the arduino and the Pins
FSR_PIN = 'A0';
forceArduino = arduino('/dev/cu.usbserial-D308G780','uno');
VCC = 4.8 
R_DIV = 9800 
waitTime = 2 

while(1)
    fsrVoltage = readVoltage(forceArduino,FSR_PIN) % read in the voltage from the FSR
    % Calculations for force
    if fsrVoltage > 0
        fsrResistance = (R_DIV*VCC)/fsrVoltage - R_DIV
        
            G = 1/fsrResistance
            fprintf("Reistance is %f\n",fsrResistance);
            if fsrResistance <= 600
                force = (G-(7.5E-4))/(3.2639E-7)
            else 
                force = G/(6.42857E-7)
            pause(waitTime);   
            
            
            fprintf("\tThe force is %f\n",force);
            writeDigitalPin(forceArduino, 'D07', 1); 
            writeDigitalPin(forceArduino, 'D06', 0); 
            writeDigitalPin(forceArduino, 'D05', 0); 
            writeDigitalPin(forceArduino, 'D04', 0); 
            writeDigitalPin(forceArduino, 'D03', 0); 
            %1.5. Turn on LEDs that correspond with how much weight we are applying
            %     based on the following criteria:
            %     If force > 2000, turn on LEDs at pins D03, D04, D05, and D06 
            
            %     If 1000 < force <= 2000, turn on LEDs at pins D04, D05, and D06 
            %     If 500 < force <= 1000, turn on LEDs at pins D05, and D06 
            %     If 250 < force <= 500, turn on LED at pin D06 
           if force > 2000
               writeDigitalPin(forceArduino,'D07',1);
               writeDigitalPin(forceArduino,'D06',1);
               writeDigitalPin(forceArduino,'D05',1);
               writeDigitalPin(forceArduino,'D04',1);
               writeDigitalPin(forceArduino,'D03',1);
           else if 1000<force<=2000
                   writeDigitalPin(forceArduino,'D07',1);
                   writeDigitalPin(forceArduino,'D06',1);
                   writeDigitalPin(forceArduino,'D05',1);
                   writeDigitalPin(forceArduino,'D04',1);
                   writeDigitalPin(forceArduino,'D03',0);
               else if 500<force<=1000
                       writeDigitalPin(forceArduino,'D07',1);
                       writeDigitalPin(forceArduino,'D06',1);
                       writeDigitalPin(forceArduino,'D05',1);
                       writeDigitalPin(forceArduino,'D04',0);
                       writeDigitalPin(forceArduino,'D03',0);
                   else 250<force<=500
                       writeDigitalPin(forceArduino,'D07',1);
                       writeDigitalPin(forceArduino,'D06',1);
                       writeDigitalPin(forceArduino,'D05',0);
                       writeDigitalPin(forceArduino,'D04',0);
                       writeDigitalPin(forceArduino,'D03',0);
                   end
                   pause(waitTime);
               end 
           end
            end 
    end
end
             
               
                       
                       
                       
                       
               
                