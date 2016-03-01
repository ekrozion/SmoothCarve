function [handles] = OutputSize(hObject, handles)
    %OutputSize Calculates the size of the engaving
    %  Multiplies the number of pixels (in X and Y) by the pixel size as
    %  specified by the user. GetUserData must be called before this function.
 
    outputX = handles.ImageDim(1, 2) * handles.PixelSize;
    outputY = handles.ImageDim(1, 1) * handles.PixelSize;
 
    %Saves the output size string into the handles structure. Display is
    %carriedout by UpdateText.m
    handles.OutputSize = ['Size (mm) : ' num2str(outputX) ' x ' num2str(outputY)];
 
    guidata(hObject, handles);
end
