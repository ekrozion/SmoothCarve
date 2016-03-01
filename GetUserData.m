function [handles] = GetUserData(hObject, handles)
    %GetUserData Read the user variables from the GUI
    %   Read each variable and store it somewhere sensible in the handles
    %   structure
    handles.MaxPower = get(handles.editMaxPower, 'String');
    handles.MaxPower = str2num(handles.MaxPower);
 
    handles.MinPower = get(handles.editMinPower, 'String');
    handles.MinPower = str2num(handles.MinPower);
 
    handles.FeedRate = get(handles.editFeedRate, 'String');
 
    handles.PixelSize = get(handles.editPixelSize, 'String');
    handles.PixelSize = str2num(handles.PixelSize);
 
    handles.AccelerationSpace = get(handles.editAccelerationSpace, 'String');
 
    handles.XOffset = get(handles.editXOffset, 'String');
    handles.XOffset = str2num(handles.XOffset);
 
    handles.YOffset = get(handles.editYOffset, 'String');
 
    guidata(hObject, handles);
end

