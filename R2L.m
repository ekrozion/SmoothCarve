function [handles] = R2L(hObject, handles)
    %R2L Processes gcode from right to left
    %   Used for EVEN numbered y lines, process the gcode from right to left
 
    s = handles.ImageDim(1, 2);
    s = s - 1;
    handles.xLength = handles.PixelSize;
    handles.CurrentPos = handles.ImageDim(1, 2) * handles.PixelSize;
 
    for i = s: - 1:1
     
        handles.Next = i + 1;
        if handles.InputArray(handles.y, i) == handles.InputArray(handles.y, handles.Next)
            handles.xLength = handles.xLength + handles.PixelSize;
        else
            handles.xLength = 0 - handles.xLength;
         
            %Calculate the required laser power level
            handles = Gray2Power(hObject, handles);
         
            %Write the Gcode to file
            handles = WriteG (hObject, handles);
         
            handles.xLength = handles.PixelSize;
         
        end
    end
 
    %Write G Code for final line segment
 
    handles.CurrentPos = handles.CurrentPos - handles.xLength;
 
    handles.Next = 1;
 
    handles.xLength = 0 - handles.xLength;
    handles = Gray2Power (hObject, handles);
    handles = WriteG (hObject, handles);
 
    handles.CurrentPos = 0;
 
    guidata(hObject, handles);
 
    handles = Accelerate (hObject, handles);
 
end

