function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 29-Feb-2016 15:53:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnOpenImage.
function btnOpenImage_Callback(hObject, eventdata, handles)
% hObject    handle to btnOpenImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Allow user to select file and store file as array in the handles structure
handles = OpenImage(hObject,handles);

%Display the Original Images, convert to Grayscale and display that too
handles = DisplayImages(hObject,handles);

%Read User Data 
handles = GetUserData(hObject,handles);

%Calculate Output Size
handles = OutputSize(hObject,handles);


%Update Text displayed on the gui
handles = UpdateText(hObject,handles);



% --- Executes on button press in btnContrast.
function btnContrast_Callback(hObject, eventdata, handles)
% hObject    handle to btnContrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Launch the contrast tool
imcontrast(handles.OutputAxes);

%Recount the grays
handles = CountGrays (hObject, handles);

%Update Text displayed on the gui
handles = UpdateText(hObject,handles);


function editMaxPower_Callback(hObject, eventdata, handles)
% hObject    handle to editMaxPower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editMaxPower as text
%        str2double(get(hObject,'String')) returns contents of editMaxPower as a double


% --- Executes during object creation, after setting all properties.
function editMaxPower_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editMaxPower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editMinPower_Callback(hObject, eventdata, handles)
% hObject    handle to editMinPower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editMinPower as text
%        str2double(get(hObject,'String')) returns contents of editMinPower as a double


% --- Executes during object creation, after setting all properties.
function editMinPower_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editMinPower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editFeedRate_Callback(hObject, eventdata, handles)
% hObject    handle to editFeedRate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editFeedRate as text
%        str2double(get(hObject,'String')) returns contents of editFeedRate as a double


% --- Executes during object creation, after setting all properties.
function editFeedRate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editFeedRate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function editPixelSize_Callback(hObject, eventdata, handles)
% hObject    handle to editPixelSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editPixelSize as text
%        str2double(get(hObject,'String')) returns contents of editPixelSize as a double


% --- Executes during object creation, after setting all properties.
function editPixelSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editPixelSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editAccelerationSpace_Callback(hObject, eventdata, handles)
% hObject    handle to editAccelerationSpace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editAccelerationSpace as text
%        str2double(get(hObject,'String')) returns contents of editAccelerationSpace as a double


% --- Executes during object creation, after setting all properties.
function editAccelerationSpace_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editAccelerationSpace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnUp.
function btnUp_Callback(hObject, eventdata, handles)
% hObject    handle to btnUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.PixelSize = get(handles.editPixelSize, 'String');
handles.PixelSize = str2num(handles.PixelSize);
handles.PixelSize = handles.PixelSize + 0.01;
handles.PixelSize = num2str(handles.PixelSize);
set(handles.editPixelSize, 'String', handles.PixelSize);

handles = GetUserData (hObject,handles);
handles = OutputSize (hObject,handles);
handles = UpdateText (hObject,handles);



% --- Executes on button press in btnDown.
function btnDown_Callback(hObject, eventdata, handles)
% hObject    handle to btnDown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.PixelSize = get(handles.editPixelSize, 'String');
handles.PixelSize = str2num(handles.PixelSize);
handles.PixelSize = handles.PixelSize - 0.01;
handles.PixelSize = num2str(handles.PixelSize);
set(handles.editPixelSize, 'String', handles.PixelSize);

handles = GetUserData (hObject,handles);
handles = OutputSize (hObject,handles);
handles = UpdateText (hObject,handles);


% --- Executes on button press in btnGenerate.
function btnGenerate_Callback(hObject, eventdata, handles)
% hObject    handle to btnGenerate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Time the output
tStart = tic;

%First make sure all the variables are up to date with user input
handles = GetUserData (hObject,handles);

%Open an output file for writing
handles = OutputFile (hObject,handles);

%Run the pre-job gcodes
handles = PreJobCode (hObject,handles);

%Move head to Offset (less x acceleration space)
handles = Move2Offset (hObject,handles);

%Now make the GCode!
handles = GenerateGCode2 (hObject,handles);

%Finish up with the Post Job Codes
handles = PostJobCode (hObject,handles);

%Close the output file
fclose(handles.fileID);

%Stop the timer
tElapsed = toc(tStart);
tElapsed = round(tElapsed, 2);
tElapsed = num2str(tElapsed);

%Let the user know you're done
h = msgbox({'Operation Completed' 'Gcode is in output.gcode' 'Time Elapsed (s):', tElapsed});

function editXOffset_Callback(hObject, eventdata, handles)
% hObject    handle to editXOffset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editXOffset as text
%        str2double(get(hObject,'String')) returns contents of editXOffset as a double


% --- Executes during object creation, after setting all properties.
function editXOffset_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editXOffset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editYOffset_Callback(hObject, eventdata, handles)
% hObject    handle to editYOffset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editYOffset as text
%        str2double(get(hObject,'String')) returns contents of editYOffset as a double


% --- Executes during object creation, after setting all properties.
function editYOffset_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editYOffset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
