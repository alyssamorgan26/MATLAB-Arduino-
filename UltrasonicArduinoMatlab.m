clear;close all;clc;
% Alyssa Morgan
% October 3 2020
% Define Pins
TRIG_PIN = 'D8';
ECHO_PIN = 'D7';
% This code tests/senses the distance an object is away from the arduino
% using an Ultrasonic Sensor
% Setup arduino object, make sure to set up the arduino for ultrasonic
sensyArduino = arduino('/dev/cu.usbserial-D308G780','Uno','libraries','ultrasonic');
% as described above!


% Setup ultrasonic sensor
ultraSensor = ultrasonic(sensyArduino,TRIG_PIN,ECHO_PIN);
%for numTests = 1:20
    %distance = readDistance(ultraSensor) % omit ; so you can see in command window
    %pause(0.25)
%end

% This while loop will run forever, so we will stick our distance reading,
% LED lighting, and noise making inside of here
while(1)
    distance = readDistance(ultraSensor)
    % Read the distance from the ultrasonic sensor
    if distance > 2 %both green led are lit
        writeDigitalPin(sensyArduino,'D11',1);
        writeDigitalPin(sensyArduino,'D10',1);
        writeDigitalPin(sensyArduino,'D13',0);
        writeDigitalPin(sensyArduino,'D9',0);
        writeDigitalPin(sensyArduino,'D12',0);
    else if  distance > 1 && distance <= 2
            if distance <= 1.25 
                writeDigitalPin(sensyArduino,'D11',0);
                writeDigitalPin(sensyArduino,'D10',1);
                writeDigitalPin(sensyArduino,'D13',1);
                writeDigitalPin(sensyArduino,'D9',0);
                writeDigitalPin(sensyArduino,'D12',0);
            else if distance > 1.25
                    writeDigitalPin(sensyArduino,'D11',0);
                    writeDigitalPin(sensyArduino,'D10',1);
                    writeDigitalPin(sensyArduino,'D13',0);
                    writeDigitalPin(sensyArduino,'D9',0);
                    writeDigitalPin(sensyArduino,'D12',0);
                end
            end
        else if distance > 0.75 && distance <= 1
                writeDigitalPin(sensyArduino,'D11',0);
                writeDigitalPin(sensyArduino,'D10',0);
                writeDigitalPin(sensyArduino,'D13',1);
                writeDigitalPin(sensyArduino,'D9',1);
                writeDigitalPin(sensyArduino,'D12',0);
            else if distance > 0 && distance <= 0.75
                    writeDigitalPin(sensyArduino,'D11',0);
                    writeDigitalPin(sensyArduino,'D10',0);
                    writeDigitalPin(sensyArduino,'D13',0);
                    writeDigitalPin(sensyArduino,'D9',1);
                    writeDigitalPin(sensyArduino,'D12',1);
                else if 0.75 < distance < 1
                        writeDigitalPin(sensyArduino,'D11',0);
                        writeDigitalPin(sensyArduino,'D10',0);
                        writeDigitalPin(sensyArduino,'D13',0);
                        writeDigitalPin(sensyArduino,'D9',0);
                        writeDigitalPin(sensyArduino,'D12',1);
                    end
                end
            end
        end
    end
end
                    
                
            
                    pause(0.5);
    % Use nested if statements to check distance and decide
    % Which if any lights need to go on
    % Use a pause so we aren't taking a million distance readings per
    % second