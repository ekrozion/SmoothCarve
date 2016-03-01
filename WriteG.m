function [ handles ] = WriteG( hObject,handles )
%WriteG Output the GCode
%   Appends the Gcode to the selected output file


handles.GLength = num2str(handles.xLength);

fprintf(handles.fileID,'G1 X%s S%s\n',handles.GLength, handles.OutputPower);  


end

