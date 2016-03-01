function [handles] = GenerateGCode2(hObject, handles)
    %GenerateGCode Make the GCode
    %   This function does the heavy lifting of generating the gcode, including
    %   allowances for the acceleation space and position the engraving at the
    %   desired point on the laser bed
 
    %Initialise the variables
    handles.xLength = handles.PixelSize;
 
    handles.y = 1;
 
    %Calculate the mapping for Min to Max power as a decimal percentage
    handles.PowerRange = (handles.MaxPower - handles.MinPower) / 100;
 
    %Begin looping through the picture, line by line
    for y = 1:handles.ImageDim(1, 1)
        handles.y = y;
     
        %Check for direction
        if mod(handles.y, 2) == 0
            %Line number is Even, process right to left
            handles = R2L (hObject, handles);
         
        else
            %Line number is Odd, process left to right
            handles = L2R (hObject, handles);
         
        end
     
        %Update progress text
        progress = (handles.y / handles.ImageDim(1, 1)) * 100;
        %Out = sprintf('Progress %3.1f%%', progress);
        progress = round(progress, 1);
        progress = num2str(progress);
        Out = ['Progress: ' progress]
     
        set(handles.textProgress, 'String', Out);
        guidata(hObject, handles);
    end
 
    guidata(hObject, handles);
end

