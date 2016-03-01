function [handles] = OutputFile(hObject, handles)
    %OpenFile Opens the output file for writing as text.
    %   This function will overwrite the existing file WITHOUT WARNING!
 
    handles.fileID = fopen('output.gcode', 'w');
 
end
