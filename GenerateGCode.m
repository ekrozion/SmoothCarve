function [ handles ] = GenerateGCode( hObject,handles )
%GenerateGCode Make the GCode
%   This function does the heavy lifting of generating the gcode, including
%   allowances for the acceleation space and position the engraving at the
%   desired point on the laser bed


%Initialise the X position to the start of the line
Xpos = 1;

%Calculate the mapping for Min to Max power as a decimal percentage
PowerRange = (handles.MaxPower - handles.MinPower)/100;




%Loop through the following statements until the end of line is reached
while Xpos < handles.ImageDim(1,2);

    XNext = Xpos + 1;
    if XNext <= handles.ImageDim(1,2);
        
         C1 = handles.InputArray(1,Xpos);
         C2 = handles.InputArray(1,XNext);

             while (C1 == C2 && XNext < handles.ImageDim(1,2))
             %Check next pixel until there is a change
             XNext = XNext + 1;
             C2 = handles.InputArray(1,XNext);
             end
         %Establish the length of the colour line and update the Xpos for the
         %next itteration
         Length = XNext - Xpos;
         Xpos = Xpos + Length;
    
         %Conver the gray value to a power level
           C1 = double(C1);
           C1 = 255 - C1; %Invert the values so 0 (black) = full power
           Power = (C1/255) * PowerRange;
           
        
         %Write the Gcode
            Out = ['G1 X' num2str(Xpos) ' S' num2str(Power)];
            disp(Out);
    
    end
end




guidata(hObject,handles);
end

