function [handles] = PostJobCode(hObject, handles)
    %PostJobCode The codes required after the job starts (homing, laser off,
    %whatever you need)
    %   Seperate codes with \n and finish with \n
 
    fprintf(handles.fileID, 'M5\nG90\nG0 X0 Y0\n');
 
end
