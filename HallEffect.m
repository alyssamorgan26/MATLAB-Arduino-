% Mech 103 final project RPM counter using a Hall-Effect Sensor
% 12/1/2020
% Author:Alyssa Morgan
% This code is for a hall effect sensor that will count the amount of times
% a magnet runs by the sensor for 15 seconds. The Hall sensor is attatched
% to an arduino and we wish to test how different gears on a bike affect 
% number of rotations of a bike tire. The magnet will be attatched to
% Bike wheel.
clear % clear command window 
counter = 0;
onFlag = 0;
Arduino = arduino('/dev/cu.usbserial-D308G780','uno');
hallsensor = 'D2'
led = 'D13'
timerDuration = 15; % Set the timer duration for the program to run

% Timer
t = timer('TimerFcn','stat=false;disp("Thank you for using the RPM Program")',...
    'startDelay',timerDuration);

start(t)
stat=true;
% Run for duration of timer set above
disp('Please wait...');
while(stat==true)
    hall=readDigitalPin(Arduino,hallsensor);
    if counter == 0;
        disp('Ready...');
    end
    if hall == 0; % 
        if onFlag == 0;
            writeDigitalPin(Arduino,led,1);
            counter = counter+1;
            disp(counter);
            onFlag = 1;
        end % end flag
    else % sensor is off
    writeDigitalPin(Arduino,led,0);
    onFlag = 0;
    end 
end 

%pause(1)
 % end timer 
delete(t);
msg = strcat('You did a total of',counter,'revs');
disp(msg);
disp(counter);
return;


    