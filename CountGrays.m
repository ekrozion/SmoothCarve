function [ handles ] = CountGrays( hObject, handles )
%CountGrays Count the number of unique gray values
%Count the number of grays in the converted image and store in the handles
%structure
handles.NumberGrays = unique(handles.InputArray);
handles.NumberGrays = size(handles.NumberGrays);
handles.NumberGrays = handles.NumberGrays(1,1);

guidata(hObject,handles);
end

