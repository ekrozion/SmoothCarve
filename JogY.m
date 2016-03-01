function [ handles ] = JogY( hObject,handles )
%JogY Move the Y direction
%   Jogs the Y axis down by one pixel width at the end of each line

Jog = handles.PixelSize;
Jog = num2str(Jog);
fprintf(handles.fileID,'G0 Y%s\n',Jog);
end

