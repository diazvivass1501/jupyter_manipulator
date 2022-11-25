function varargout = JUPYTER_GUIDE(varargin)
% JUPYTER_GUIDE MATLAB code for JUPYTER_GUIDE.fig
%      JUPYTER_GUIDE, by itself, creates a new JUPYTER_GUIDE or raises the existing
%      singleton*.
%
%      H = JUPYTER_GUIDE returns the handle to a new JUPYTER_GUIDE or the handle to
%      the existing singleton*.
%
%      JUPYTER_GUIDE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in JUPYTER_GUIDE.M with the given input arguments.
%
%      JUPYTER_GUIDE('Property','Value',...) creates a new JUPYTER_GUIDE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before JUPYTER_GUIDE_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to JUPYTER_GUIDE_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help JUPYTER_GUIDE

% Last Modified by GUIDE v2.5 22-Nov-2022 00:37:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @JUPYTER_GUIDE_OpeningFcn, ...
                   'gui_OutputFcn',  @JUPYTER_GUIDE_OutputFcn, ...
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


% --- Executes just before JUPYTER_GUIDE is made visible.
function JUPYTER_GUIDE_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to JUPYTER_GUIDE (see VARARGIN)

% Choose default command line output for JUPYTER_GUIDE
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes JUPYTER_GUIDE wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = JUPYTER_GUIDE_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


axes(handles.graficaJupyter);
grid on
L1=250;L2=220;L3=100;L4=50;

Apris = 0;
Atheta1 = 0;
Apris2 = 0;
Atheta2 = 0;
pris = 0;

theta1=0;theta2=0;pris2=0;
A=[1 0 0 0;
   0 1 0 0;
   0 0 1 0;
   0 0 0 1];   

t1=denavit(pi/2,pris,0,pi/2);
t2=denavit(theta1,pris2+90,0,0);
t21=denavit(theta1,0,0,0);
t3=denavit(pi,0,0,pi/2);
t4=denavit(theta2,150,0,0);

T1=t1;
T1_2=t1*t21;
T2=t1*t2;
T3=T2*t3;
T4=T3*t4;

%------------------------- STL -----------------------

piezas_stl(T1,T2,T1_2,T4)

%-----------------------------------------------------

dibujar_sistema_coordenadas(A,60,'0');
hold on;
dibujar_sistema_coordenadas(T1,60,'1');
hold on;
dibujar_sistema_coordenadas(T2,60,'2');
hold on;
dibujar_sistema_coordenadas(T3,60,'3');
hold on;
dibujar_sistema_coordenadas(T4,60,'4');
hold on;


grid on
axis([-40 300 -250 250 -50 400]);
cameratoolbar('SetCoordSys','x');
cameratoolbar('SetMode','orbit');
cameratoolbar;
pause(0.1);


function Prismatico1_Callback(hObject, eventdata, handles)
% hObject    handle to Prismatico1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Prismatico1 as text
%        str2double(get(hObject,'String')) returns contents of Prismatico1 as a double


% --- Executes during object creation, after setting all properties.
function Prismatico1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Prismatico1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rotacional1_Callback(hObject, eventdata, handles)
% hObject    handle to Rotacional1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rotacional1 as text
%        str2double(get(hObject,'String')) returns contents of Rotacional1 as a double


% --- Executes during object creation, after setting all properties.
function Rotacional1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rotacional1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Prismatico2_Callback(hObject, eventdata, handles)
% hObject    handle to Prismatico2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Prismatico2 as text
%        str2double(get(hObject,'String')) returns contents of Prismatico2 as a double


% --- Executes during object creation, after setting all properties.
function Prismatico2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Prismatico2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rotacional2_Callback(hObject, eventdata, handles)
% hObject    handle to Rotacional2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rotacional2 as text
%        str2double(get(hObject,'String')) returns contents of Rotacional2 as a double


% --- Executes during object creation, after setting all properties.
function Rotacional2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rotacional2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in enviarJupyter.
function enviarJupyter_Callback(hObject, eventdata, handles)
% hObject    handle to enviarJupyter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%---------declaro las dimensiones de los eslabones a usar------------------
grid on;
axes(handles.graficaJupyter);
L1=250;L2=220;L3=100;L4=50;


%----------Declaramos la distanica q debe moverse los prismaticos y los
%rotacionales.-------
Apris = str2double(get(handles.Prismatico1,'String'));
Atheta11=str2double(get(handles.Rotacional1,'String'));
Atheta1=(Atheta11)*(pi/180);
Apris2=str2double(get(handles.Prismatico2,'String'))+90;
Atheta22=str2double(get(handles.Rotacional2,'String'));
Atheta2=(Atheta22)*(pi/180);
disp(Apris);
disp(Atheta1);
disp(Apris2);
disp(Atheta2);

% --------------------DIRECTA DEL MANIPULADOR JUPYTER----------------------
%% __________________________ GEOMETRICO ______________________________

[GEOMETRICO]=GEOMETRICO_JUPYTER(Apris2,L3,L4,Atheta1,Atheta2,Apris)
   
%% -----------------Primera Articulacion Prismatica-------------------------
for pris=0:10:Apris
    cla
theta1=0;theta2=0;pris2=90;

[T1,T1_2,T2,T3,T4] = denavith_jupyter(pris,pris2,theta1,theta2);

%------------------------- STL -----------------------

piezas_stl(T1,T2,T1_2,T4);

%-----------------------------------------------------
A=eye(4);
coordenadas(A,T1,T2,T3,T4)
end

%% -----------------Primera Articulacion Rotacional -------------------------
for theta1=0:-0.1*pi:Atheta1
    cla

theta2=0;pris2=90;
pris=Apris;

[T1,T1_2,T2,T3,T4] = denavith_jupyter(pris,pris2,theta1,theta2);

%------------------------- STL -----------------------

piezas_stl(T1,T2,T1_2,T4);

%-----------------------------------------------------
A=eye(4);
coordenadas(A,T1,T2,T3,T4)

end


%% ----------------- Segunda Articulacion Prismatica-------------------------
for pris2=90:10:Apris2
    cla
pris=Apris;
theta1=Atheta1;
theta2=0;

[T1,T1_2,T2,T3,T4] = denavith_jupyter(pris,pris2,theta1,theta2);

%------------------------- STL -----------------------

piezas_stl(T1,T2,T1_2,T4);

%-----------------------------------------------------
A=eye(4);
coordenadas(A,T1,T2,T3,T4)

end

%----------------- Segunda Articulacion Rotacional ------------------------
for theta2=0:0.1*pi:Atheta2
    cla
pris=Apris;

[T1,T1_2,T2,T3,T4] = denavith_jupyter(pris,pris2,theta1,theta2);

%------------------------- STL -----------------------

piezas_stl(T1,T2,T1_2,T4);

%-----------------------------------------------------
A=eye(4);
coordenadas(A,T1,T2,T3,T4)

end

  cla


A=[1 0 0 0;
   0 1 0 0;
   0 0 1 0;
   0 0 0 1];   
t1=denavit(pi/2,Apris,0,pi/2);
t2=denavit(Atheta1,Apris2,0,0);
t21=denavit(Atheta1,0,0,0);
t3=denavit(pi,0,0,pi/2);
t4=denavit(Atheta2,150,0,0);

T1=t1;
T1_2=t1*t21;
T2=t1*t2;
T3=T2*t3;
T4=T3*t4;
A01=t1
A12=t2
A23=t3
A34=t4
DH=T4;


%------------------------- STL -----------------------

piezas_stl(T1,T2,T1_2,T4);

%-----------------------------------------------------

A=eye(4);
coordenadas(A,T1,T2,T3,T4)



set(handles.tablaDenavit,'data',DH);
set(handles.tablageometrico,'data',GEOMETRICO);
