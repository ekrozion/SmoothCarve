function [ handles ] = L2R( hObject,handles )
%L2R Processes gcode from left to right
%   Used for ODD numbered y lines, process the gcode from left to right 

handles.CurrentPos = 0;
handles.xLength = handles.PixelSize;

for i = 2:handles.ImageDim(1,2)
   
   handles.Previous = i - 1;
   if handles.InputArray(handles.y,i) == handles.InputArray(handles.y,handles.Previous)
     handles.xLength = handles.xLength + handles.PixelSize;
   else
    %handles.CurrentPos = handles.CurrentPos + handles.xLength;
         
    %Calculate the required laser power level
    handles = Gray2Power(hObject,handles);
    
    %Write the Gcode to file
    handles = WriteG (hObject,handles);
    
     
     handles.xLength = handles.PixelSize;
     
   end
end


   
%Write G Code for final line segment

     handles.CurrentPos = handles.CurrentPos + handles.xLength;
     handles.Previous = handles.ImageDim(1,2);
    
     handles = Gray2Power (hObject,handles);
     handles = WriteG (hObject,handles);


     handles.CurrentPos = 0;

%Move the head for the acclereation space
     handles = Accelerate (hObject,handles);
guidata(hObject,handles);
end

