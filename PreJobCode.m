function [ handles ] = PreJobCode( hObject,handles )
%PreJobCodes The codes required before the job starts (homing, laser on,
%whatever you need)
%   Seperate codes with \n and finish with \n

fprintf(handles.fileID,'G21\nG90\nM3\n');


end

