function [handles] = UpdateText(hObject, handles)
    %UdateText Update the various text on the gui
 
    %Create the string with the image size in it and dispaly in the GUI
    ImSize = ['Image Size: ' num2str(handles.ImageDim(1, 2)) ' x ' num2str(handles.ImageDim(1, 1))];
    set(handles.textImageSize, 'String', ImSize)
 
    %Create the string with the number of grays in it and display in th GUI
    NumGrays = ['Number of grays: ' num2str(handles.NumberGrays)];
    set(handles.textNumberGrays, 'String', NumGrays);
 
    %Update output size
    set(handles.textOutputSize, 'String', handles.OutputSize);
 
    %update the handles structure with any canges
    guidata(hObject, handles);
end
