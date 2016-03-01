function [ handles ] = Accelerate( hObject,handles )
%Accelerate Accelerates the head
%   Checks for direction of travel, sends the head the distance of
%   AccelerationSpace in teh same direction, jogs the Y axis if this is not the first line
%   then accelerates in the opposite direction ready for the next line to start

if mod(handles.y,2) == 0
    %even therefore R2L
    
    fprintf(handles.fileID,'G1 X-%s S0 F%s\n', handles.AccelerationSpace, handles.FeedRate);
    
    handles = JogY (hObject,handles);
        
    fprintf(handles.fileID,'G1 X%s S0 F%s\n', handles.AccelerationSpace, handles.FeedRate);
else 
    %odd therefore L2R
    
    fprintf(handles.fileID,'G1 X%s S0 F%s\n', handles.AccelerationSpace, handles.FeedRate);
    
    handles = JogY (hObject,handles);
       
    fprintf(handles.fileID,'G1 X-%s S0 F%s\n', handles.AccelerationSpace, handles.FeedRate);
end



end

