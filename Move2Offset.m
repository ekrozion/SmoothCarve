function [handles] = Move2Offset(hObject, handles)
    %Move2Offset Takes the user ofset and moves the head
    %   X position is minus the acceleration space specified, image will appear
    %   at the correct offset position once this is taken into account
 
   
    CorrectedX = handles.XOffset - str2num(handles.AccelerationSpace);
    CorrectedX = num2str(CorrectedX);
 
    fprintf(handles.fileID, 'G90\nG0 X%s Y%s\nG91\n', CorrectedX, handles.YOffset);
 
    %First line acceleration -do not change
    fprintf(handles.fileID, 'G1 X%s S0 F%s\n', handles.AccelerationSpace, handles.FeedRate);
end
