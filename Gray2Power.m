function [ handles ] = Gray2Power( hObject, handles )
%Gray2Power Converts gray scale value to laser power
%   Takes the gray intensity of the current pixel, reverses it (so 0
%   (black) becomes full power, and ranges it based on the user specified
%   power range

       if mod(handles.y,2) == 0
         %Get gray value of next if even line
         Intensity = handles.InputArray(handles.y,handles.Next);
       else
         %Get gray value of preivous if odd line
         Intensity = handles.InputArray(handles.y,handles.Previous);
       end
       
     Intensity = double(Intensity);
     Intensity = 255 - Intensity; %Invert the values so 0 (black) = full power
     handles.OutputPower = (Intensity/255) * handles.PowerRange;
     handles.OutputPower = round(handles.OutputPower, 3);
     handles.OutputPower = num2str(handles.OutputPower);     


end

