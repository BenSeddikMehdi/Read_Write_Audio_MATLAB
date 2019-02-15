%% Receive Tones using MATLAB
%% I- Record Audio
% Recording data from an audio input device (such as a microphone connected 
% to your system) for processing in MATLAB.
% 
% The following examples show how to use the record methods.
%% Record Microphone Input
% This exapmle shows how to record microphone input, play back the recording, 
% and store the recorded audio signal in a numeric array. You must first connect 
% a microphone to your system.
% 
% Create an _audiorecorder_ object named recObj for recording audio input.

recObj = audiorecorder        % display its properties
%% 
% As you see _audiorecorder_ creates an 8 KHz, 8-bit, 1-channel _audiorecorder_ 
% object.
% 
% We can change all these parameters like we want for example we can replace 
% the  8 KHz with 44.1 KHz in the SampleRate also NumberOfChannels regarding how 
% many channels do we have in our sound card, etc.
% 
% Record voice for 5 seconds or can choose your own time recording.

disp('Start recording... Say somthing...!!')
recordblocking(recObj,5);
disp('End of recording.')
%% 
% Play back the recording.

disp('Record is playing... we can hear what we said previously')
play(recObj);
%% 
% Store data in double-precision array.

recordData = getaudiodata(recObj);
%% 
% Plot the audio samples.

plot(recordData)
title('Record')
%% 
% Plot the audio FFT.

plot(fft(recordData))
title('FFt of audio recorded')
%% II- Write Audio
%% Description : 
% |_audiowrite(|filename,recordData,SampleRate|)|_ writes a matrix of audio 
% data, recordData, with sample rate |Fs| to a file called |filename|. The |filename| 
% input also specifies the output file format. The _output data type_ depends 
% on the output file format and the data type of the audio data, recordData. 

audiowrite('myrecord.wav',recordData,recObj.SampleRate)
%% Specify the Quality of the Recording
% By default, an _audiorecorder_ object uses a sample rate of 8 KHz, a depth 
% of 8-bit (8 bits per sample), and a single audio channel. These settings minimize 
% the required amount of data storage. For higher quality recordings, increase 
% the sample rate or bit depth.
% 
% For example, typical compact disks use a sample rate or 44.1 KHz and a 
% 16-bit depth. Create an _audiorecorder_ object to record in stereo mode (two 
% channels) with those settings : 

% myRecObj = audiorecorder(44100,16,2)
%% Note : 
% Most sound cards support sample rates between approximately 5 and 48 KHz. 
% Specifying sample rates outside this range can produce unexpected results.
%% Tips :
% * To use an _audiorecorder_ object, your system must have a properly installed 
% and configured sound card.
% * _audiorecorder _is not intended for long, high-sample-rate recording. _audiorecorder 
% _uses system memory for storage and does not use disk buffering. When you attempt 
% a large recording, your MATLAB performance somtimes degrades over time. 
%% References :
% * <https://www.mathworks.com/help/matlab/import_export/record-and-play-audio.html 
% https://www.mathworks.com/help/matlab/import_export/record-and-play-audio.html>