function varargout = Guide(varargin)
%GUIDE MATLAB code file for Guide.fig
%      GUIDE, by itself, creates a new GUIDE or raises the existing
%      singleton*.
%
%      H = GUIDE returns the handle to a new GUIDE or the handle to
%      the existing singleton*.
%
%      GUIDE('Property','Value',...) creates a new GUIDE using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Guide_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      GUIDE('CALLBACK') and GUIDE('CALLBACK',hObject,...) call the
%      local function named CALLBACK in GUIDE.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Guide

% Last Modified by GUIDE v2.5 06-Nov-2022 19:34:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Guide_OpeningFcn, ...
                   'gui_OutputFcn',  @Guide_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before Guide is made visible.
function Guide_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Guide
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Guide wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Guide_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
grid on
L1=250;L2=220;L3=150;L4=48;

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
t4=denavit(theta2,(L3+L4),0,0);

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

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
%----------------------Parametros del manipulador----------------------

%-------------------- Limites de cada articulacion --------------------

L1=250;L2=220;L3=150;L4=48;


%----------Declaramos la distanica q debe moverse los prismaticos y los
%rotacionales.-------
Apris = str2double(get(handles.t11,'String'));
Atheta11=str2double(get(handles.t2,'String'));
Atheta1=(Atheta11)*(pi/180);
Apris2=str2double(get(handles.q3,'String'))+90;
Atheta22=str2double(get(handles.t4,'String'));
Atheta2=(Atheta22)*(pi/180);
disp(Apris);
disp(Atheta1);
disp(Apris2);
disp(Atheta2);

if (Apris >=0) && (Apris <=160) && (Atheta1 <=0) && (Atheta1 >=-pi/2) && (Apris2 >=0) && (Apris2 <=120) && (Atheta2 >=0) && (Atheta2<=pi)
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

    %% ----------------- Segunda Articulacion Rotacional ------------------------
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
    %% ---
      cla


    A=[1 0 0 0;
       0 1 0 0;
       0 0 1 0;
       0 0 0 1];   
    t1=denavit(pi/2,Apris,0,pi/2);
    t2=denavit(Atheta1,Apris2,0,0);
    t21=denavit(Atheta1,0,0,0);
    t3=denavit(pi,0,0,pi/2);
    t4=denavit(Atheta2,(L3+L4),0,0);

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

    set(handles.tablageometrico,'data',GEOMETRICO);

    set(handles.DENAVIT,'data',DH);

    plot3(variable(1, 4), variable(2, 4), variable(3, 4))
else 
    errordlg( 'LOS VALORES INGRESADOS NO SON VALIDOS O ESTÁN PROVOCANDO UN CHOQUE');
end
%% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function t11_Callback(hObject, eventdata, handles)
% hObject    handle to t11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t11 as text
%        str2double(get(hObject,'String')) returns contents of t11 as a double


% --- Executes during object creation, after setting all properties.
function t11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function t2_Callback(hObject, eventdata, handles)
% hObject    handle to t2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t2 as text
%        str2double(get(hObject,'String')) returns contents of t2 as a double


% --- Executes during object creation, after setting all properties.
function t2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q3_Callback(hObject, eventdata, handles)
% hObject    handle to q3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q3 as text
%        str2double(get(hObject,'String')) returns contents of q3 as a double


% --- Executes during object creation, after setting all properties.
function q3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function t4_Callback(hObject, eventdata, handles)
% hObject    handle to t4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t4 as text
%        str2double(get(hObject,'String')) returns contents of t4 as a double


% --- Executes during object creation, after setting all properties.
function t4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to t11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t11 as text
%        str2double(get(hObject,'String')) returns contents of t11 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function DENAVIT_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to DENAVIT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
