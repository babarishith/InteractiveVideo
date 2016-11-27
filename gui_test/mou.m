function varargout = mou(varargin)
% MOU MATLAB code for mou.fig
%      MOU, by itself, creates a new MOU or raises the existing
%      singleton*.
%
%      H = MOU returns the handle to a new MOU or the handle to
%      the existing singleton*.
%
%      MOU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MOU.M with the given input arguments.
%
%      MOU('Property','Value',...) creates a new MOU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mou_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mou_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mou

% Last Modified by GUIDE v2.5 27-Nov-2016 14:55:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mou_OpeningFcn, ...
                   'gui_OutputFcn',  @mou_OutputFcn, ...
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


% --- Executes just before mou is made visible.
function mou_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mou (see VARARGIN)
handles.flag = 0;
handles.img = imread('penc.jpg');
figure(handles.back)
imshow(handles.img);

% Choose default command line output for mou
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mou wait for user response (see UIRESUME)
% uiwait(handles.back);


% --- Outputs from this function are returned to the command line.
function varargout = mou_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on mouse motion over figure - except title and menu.
function back_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.flag == 0
    return;
end
pos = get(hObject, 'currentpoint'); % get mouse location on figure
x = pos(1); y = pos(2); % assign locations to x and y
figure(handles.back)
imshow(handles.img);


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function back_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.flag = 1;
handles.output = hObject;
guidata(hObject, handles);


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function back_WindowButtonUpFcn(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.flag = 0;
handles.output = hObject;
guidata(hObject, handles);
