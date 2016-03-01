function [handles] = OpenFile(hObject, handles)
%OpenFile opens the UI file open dialoge
%   Selects the file and stores the path and filename, and image data in
%   the handles structure
[filename, pathname] = uigetfile({'*.png';'*.jpg';'*.bmp';'*.*'});
handles.FileName = strcat(pathname, filename);
handles.InputArray = imread(handles.FileName);

%Read the size of the image file
handles.ImageDim = size(handles.InputArray);

%update the handles structure with any canges
guidata(hObject,handles);
end

