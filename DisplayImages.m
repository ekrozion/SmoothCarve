function [handles] = DisplayImages(hObject, handles)
    %DisplayImages
    %   Displays the original image, converts to gray scale and displays that
    %   too
 
    %Select the input file axes and displays the unaltered image
 
    %Check if the image is colour RGB and converts to grayscale if required
    if ndims(handles.InputArray) > 2
        handles.InputArray = rgb2gray(handles.InputArray);
    end
 
    %call the function to count the grays
    handles = CountGrays (hObject, handles);
 
    %Select the output file axes and display the converted file (or original
    %file if conversion not required)
    axes(handles.OutputAxes);
    imshow(handles.InputArray);
 
    %make sure all the data is written back to the handles structure
    guidata(hObject, handles);
end
