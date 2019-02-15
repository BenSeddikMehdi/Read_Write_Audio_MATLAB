%% Generating Sounds over Matlab
%% I - Creating Sinus Pulse
%%
Amplitude = 1;                         % 1V     
samplingFrequency = 48000;             % 48 KHz
frequency = 20e+3;                     % 20 KHz
duration = 0.01;                       % 10 ms 
t = 0:1/samplingFrequency:duration;    % Time Vector
%%
sinusPulse = Amplitude*sin(2*pi*frequency*t); % sinusPulse(t) = 1*sin(2*pi*1000*t)
%% I- 1- Plotting Sinus
%%
plot(t,sinusPulse); 
title('Sin(2*pi*20000*t)')   % title
ylabel('Amplitude (V)')
xlabel('time (s)')
ylim([-1.2 1.2])
%% I- 2- Adding Random Numbers
% "rand" Function should be the same size of sinusPulse

noisingSignal = sinusPulse.*rand(1,length(sinusPulse)); % .* It means multiply by elements 
%%
plot(t,noisingSignal)   % Plotting signal
title('Noising Signal')   % title
ylabel('Amplitude (V)')
xlabel('time (s)')
ylim([-1.2 1.2])
%% I- 3- Listening to the noise tone
%%
sound(noisingSignal)  
%% I- 4- Spectral Analysis
%% Fast Fourier Transform
%%
noisingSignalFFT = fft(noisingSignal);      % Calculate the fft of the noise Signal
lenSignal = length(noisingSignalFFT);       % Calculate the length of the noising Signal
%% 
% Compute the two-sided spectrum |P2|. Then compute the single-sided spectrum 
% |P1.|

P2 = abs(noisingSignalFFT/lenSignal);        % Calculate the Module or just the real values
                                             % because the fft produce 
                                             % complex values
P1 = P2(1:round(lenSignal/2)-1);             % Single Side 
%% 
% Define the frequency domain |f| and plot the single-sided amplitude spectrum 
% |P1|.

f = samplingFrequency*(0:(lenSignal/2)-1)/lenSignal;            % Frequency Vector
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of Noising Signal(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
%% 
% As you see we have a peak at 20 KHz with a random amplitude due rand function 
% and sinus function respectively.