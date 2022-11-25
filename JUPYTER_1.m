function varargout = JUPYTER_1(varargin)
% JUPYTER_1 MATLAB code for JUPYTER_1.fig
%      JUPYTER_1, by itself, creates a new JUPYTER_1 or raises the existing
%      singleton*.
%
%      H = JUPYTER_1 returns the handle to a new JUPYTER_1 or the handle to
%      the existing singleton*.
%
%      JUPYTER_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in JUPYTER_1.M with the given input arguments.
%
%      JUPYTER_1('Property','Value',...) creates a new JUPYTER_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before JUPYTER_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to JUPYTER_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help JUPYTER_1

% Last Modified by GUIDE v2.5 26-Oct-2022 00:40:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @JUPYTER_1_OpeningFcn, ...
                   'gui_OutputFcn',  @JUPYTER_1_OutputFcn, ...
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


% --- Executes just before JUPYTER_1 is made visible.
function JUPYTER_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to JUPYTER_1 (see VARARGIN)

% Choose default command line output for JUPYTER_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes JUPYTER_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = JUPYTER_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
%----------- limpamos pantalla y cerramos ventanas ------------------------




function Q1_Callback(hObject, eventdata, handles)
% hObject    handle to Q1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q1 as text
%        str2double(get(hObject,'String')) returns contents of Q1 as a double


% --- Executes during object creation, after setting all properties.
function Q1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Q2_Callback(hObject, eventdata, handles)
% hObject    handle to Q2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q2 as text
%        str2double(get(hObject,'String')) returns contents of Q2 as a double


% --- Executes during object creation, after setting all properties.
function Q2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Q3_Callback(hObject, eventdata, handles)
% hObject    handle to Q3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q3 as text
%        str2double(get(hObject,'String')) returns contents of Q3 as a double


% --- Executes during object creation, after setting all properties.
function Q3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Q4_Callback(hObject, eventdata, handles)
% hObject    handle to Q4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q4 as text
%        str2double(get(hObject,'String')) returns contents of Q4 as a double


% --- Executes during object creation, after setting all properties.
function Q4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;clear;close all;

%---------declaro las dimensiones de los eslabones a usar------------------
L1=250;L2=220;L3=100;L4=50;

%----------Declaramos la distanica q debe moverse los prismaticos y los
%rotacionales.-------
% disp('Valores de 0 a 160')
% Apris=input('Prismatico N°1: ');
% Atheta1=input('Rotacional N°1: ');
% disp('Valores de 120 a 210')
% Apris2=input('Prismatico N°2: ')-90;
% Atheta2=input('Rotacional N°2: ');
% 0 A 160
Apris=get(handles.Q1,'String');
Atheta1=get(handles.Q2,'String');

%0 a 210
Apris2=get(handles.Q3,'String');
Atheta2=get(handles.Q4,'String');

% 
% % 0 A 160
% Apris=160;
% Atheta1=-pi/8;
% 
% %0 a 210
% Apris2=120; %compenzar con 90
% Atheta2=-pi/4;

%--------------------DIRECTA DEL MANIPULADOR JUPYTER----------------------
%-----------------Primera Articulacion Prismatica-------------------------

for pris=0:10:Apris
    clf
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

T1=t1
T1_2=t1*t21
T2=t1*t2
T3=T2*t3
T4=T3*t4

%------------------------- STL -----------------------


base=Load_STL('BASE.STL');
base_sr1=Load_STL('BASE SR1.STL');
base_pr=Load_STL('BASAE PR.STL');
base_r2=Load_STL('BASE R2.STL');
base_final=Load_STL('FINAL.STL');

H=eye(4);
Aa=[1 0 0 -37.4;
   0 1 0 -35;
   0 0 1 -20;
   0 0 0 1];  

TR1=[1 0 0 -30;
   0 1 0 -30;
   0 0 1 -36;
   0 0 0 1]; 

TR2=[1 0 0 -30;
   0 1 0 -30;
   0 0 1 5;
   0 0 0 1]; 

TR3=[1 0 0 -30;
   0 1 0 -15;
   0 0 1 -40;
   0 0 0 1]; 

TR4=[1 0 0 -30;
   0 1 0 -30;
   0 0 1 22;
   0 0 0 1]; 

TTR=T1*TR1;
TTR2=T1_2*TR2;
TTR3=T2*TR3;
TTR4=T4*TR4;
eslabon_STL(Aa,base,'w');
eslabon_STL(TTR,base_sr1,'w');
eslabon_STL(TTR2,base_pr,'w');
eslabon_STL(TTR3,base_r2,'w');
eslabon_STL(TTR4,base_final,'w');
camlight('left')



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

P0=[A(13) A(14) A(15)];
P1=[0 0 250];
P21=[200 0 pris];
P2=[T1(13) T1(14) T1(15)];
P3=[T2(13) T2(14) T2(15)];
P4=[T3(13) T3(14) T3(15)];
P5=[T4(13) T4(14) T4(15)];

% dibujar_linea(P0,P1 ,'C',3); 
% hold on;
% dibujar_linea(P0,P2 ,'C',3); 
% hold on;
% dibujar_linea(P21,P3 ,'b',3); 
% hold on;
% dibujar_linea(P2,P3 ,'b',3); 
% hold on;
% dibujar_linea(P4,P5 ,'k',3); 
% hold on;

axis([-40 300 -250 250 -50 400]);
cameratoolbar('SetCoordSys','x');
cameratoolbar('SetMode','orbit');
cameratoolbar;
pause(0.1);

end

%-----------------Primera Articulacion Rotacional -------------------------

for theta1=0:0.1*pi:Atheta1
    clf
    
theta2=0;pris2=0;
A=[1 0 0 0;
   0 1 0 0;
   0 0 1 0;
   0 0 0 1];   
pris=Apris;
t1=denavit(pi/2,pris,0,pi/2);
t2=denavit(theta1,pris2+90,0,0);
t21=denavit(theta1,0,0,0);
t3=denavit(pi,0,0,pi/2);
t4=denavit(theta2,150,0,0);

T1=t1
T1_2=t1*t21;
T2=t1*t2
T3=T2*t3
T4=T3*t4

%------------------------- STL -----------------------


base=Load_STL('BASE.STL');
base_sr1=Load_STL('BASE SR1.STL');
base_pr=Load_STL('BASAE PR.STL');
base_r2=Load_STL('BASE R2.STL');
base_final=Load_STL('FINAL.STL');

H=eye(4);
Aa=[1 0 0 -37.4;
   0 1 0 -35;
   0 0 1 -20;
   0 0 0 1];  

TR1=[1 0 0 -30;
   0 1 0 -30;
   0 0 1 -36;
   0 0 0 1]; 

TR2=[1 0 0 -30;
   0 1 0 -30;
   0 0 1 5;
   0 0 0 1]; 

TR3=[1 0 0 -30;
   0 1 0 -15;
   0 0 1 -40;
   0 0 0 1];  

TR4=[1 0 0 -30;
   0 1 0 -30;
   0 0 1 22;
   0 0 0 1]; 

TTR=T1*TR1;
TTR2=T1_2*TR2;
TTR3=T2*TR3;
TTR4=T4*TR4;
eslabon_STL(Aa,base,'w');
eslabon_STL(TTR,base_sr1,'w');
eslabon_STL(TTR2,base_pr,'w');
eslabon_STL(TTR3,base_r2,'w');
eslabon_STL(TTR4,base_final,'w');
camlight('left')



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


P0=[A(13) A(14) A(15)];
P1=[0 0 250];
P21=[200 0 pris];
P2=[T1(13) T1(14) T1(15)];
P3=[T2(13) T2(14) T2(15)];
P4=[T3(13) T3(14) T3(15)];
P5=[T4(13) T4(14) T4(15)];

% dibujar_linea(P0,P1 ,'C',3); 
% hold on;
% dibujar_linea(P0,P2 ,'C',3); 
% hold on;
% dibujar_linea(P21,P3 ,'b',3); 
% hold on;
% dibujar_linea(P2,P3 ,'b',3); 
% hold on;
% dibujar_linea(P4,P5 ,'k',3); 
% hold on;

axis([-40 300 -250 250 -50 400]);
cameratoolbar('SetCoordSys','x');
cameratoolbar('SetMode','orbit');
cameratoolbar;
pause(0.1);
   
end


%----------------- Segunda Articulacion Prismatica-------------------------
for pris2=0:10:Apris2
    clf
        clf
A=[1 0 0 0;
   0 1 0 0;
   0 0 1 0;
   0 0 0 1]; 

pris=Apris;
theta1=Atheta1;
theta2=0;

t1=denavit(pi/2,pris,0,pi/2);
t2=denavit(theta1,pris2+90,0,0);
t21=denavit(theta1,0,0,0);
t3=denavit(pi,0,0,pi/2);
t4=denavit(theta2,150,0,0);

T1=t1
T1_2=t1*t21
T2=t1*t2
T3=T2*t3
T4=T3*t4

%------------------------- STL -----------------------


base=Load_STL('BASE.STL');
base_sr1=Load_STL('BASE SR1.STL');
base_pr=Load_STL('BASAE PR.STL');
base_r2=Load_STL('BASE R2.STL');
base_final=Load_STL('FINAL.STL');

H=eye(4);
Aa=[1 0 0 -37.4;
   0 1 0 -35;
   0 0 1 -20;
   0 0 0 1];  

TR1=[1 0 0 -30;
   0 1 0 -30;
   0 0 1 -36;
   0 0 0 1]; 

TR2=[1 0 0 -30;
   0 1 0 -30;
   0 0 1 5;
   0 0 0 1]; 

TR3=[1 0 0 -30;
   0 1 0 -15;
   0 0 1 -40;
   0 0 0 1]; 

TR4=[1 0 0 -30;
   0 1 0 -30;
   0 0 1 22;
   0 0 0 1]; 

TTR=T1*TR1;
TTR2=T1_2*TR2;
TTR3=T2*TR3;
TTR4=T4*TR4;
eslabon_STL(Aa,base,'w');
eslabon_STL(TTR,base_sr1,'w');
eslabon_STL(TTR2,base_pr,'w');
eslabon_STL(TTR3,base_r2,'w');
eslabon_STL(TTR4,base_final,'w');
camlight('left')



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


P0=[A(13) A(14) A(15)];
P1=[0 0 250];
P21=[200 0 pris];
P2=[T1(13) T1(14) T1(15)];
P3=[T2(13) T2(14) T2(15)];
P4=[T3(13) T3(14) T3(15)];
P5=[T4(13) T4(14) T4(15)];

% dibujar_linea(P0,P1 ,'C',3); 
% hold on;
% dibujar_linea(P0,P2 ,'C',3); 
% hold on;
% dibujar_linea(P21,P3 ,'b',3); 
% hold on;
% dibujar_linea(P2,P3 ,'b',3); 
% hold on;
% dibujar_linea(P4,P5 ,'k',3); 
% hold on;

axis([-40 300 -250 250 -50 400]);
cameratoolbar('SetCoordSys','x');
cameratoolbar('SetMode','orbit');
cameratoolbar;
pause(0.1);
end


%----------------- Segunda Articulacion Rotacional ------------------------
if Atheta2 >=0
    for theta2=0:0.1*pi:Atheta2
        clf


    A=[1 0 0 0;
       0 1 0 0;
       0 0 1 0;
       0 0 0 1];   
    pris=Apris;
    t1=denavit(pi/2,pris,0,pi/2);
    t2=denavit(theta1,pris2+90,0,0);
    t21=denavit(theta1,0,0,0);
    t3=denavit(pi,0,0,pi/2);
    t4=denavit(theta2,150,0,0);

    T1=t1
    T1_2=t1*t21;
    T2=t1*t2
    T3=T2*t3
    T4=T3*t4

    %------------------------- STL -----------------------


    base=Load_STL('BASE.STL');
    base_sr1=Load_STL('BASE SR1.STL');
    base_pr=Load_STL('BASAE PR.STL');
    base_r2=Load_STL('BASE R2.STL');
    base_final=Load_STL('FINAL.STL');

    H=eye(4);
    Aa=[1 0 0 -37.4;
       0 1 0 -35;
       0 0 1 -20;
       0 0 0 1];  

    TR1=[1 0 0 -30;
       0 1 0 -30;
       0 0 1 -36;
       0 0 0 1]; 

    TR2=[1 0 0 -30;
       0 1 0 -30;
       0 0 1 5;
       0 0 0 1]; 

    TR3=[1 0 0 -30;
       0 1 0 -15;
       0 0 1 -40;
       0 0 0 1];  

    TR4=[1 0 0 -30;
       0 1 0 -30;
       0 0 1 22;
       0 0 0 1]; 

    TTR=T1*TR1;
    TTR2=T1_2*TR2;
    TTR3=T2*TR3;
    TTR4=T4*TR4;
    eslabon_STL(Aa,base,'w');
    eslabon_STL(TTR,base_sr1,'w');
    eslabon_STL(TTR2,base_pr,'w');
    eslabon_STL(TTR3,base_r2,'w');
    eslabon_STL(TTR4,base_final,'w');
    camlight('left')



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


    P0=[A(13) A(14) A(15)];
    P1=[0 0 250];
    P21=[200 0 pris];
    P2=[T1(13) T1(14) T1(15)];
    P3=[T2(13) T2(14) T2(15)];
    P4=[T3(13) T3(14) T3(15)];
    P5=[T4(13) T4(14) T4(15)];

    % dibujar_linea(P0,P1 ,'C',3); 
    % hold on;
    % dibujar_linea(P0,P2 ,'C',3); 
    % hold on;
    % dibujar_linea(P21,P3 ,'b',3); 
    % hold on;
    % dibujar_linea(P2,P3 ,'b',3); 
    % hold on;
    % dibujar_linea(P4,P5 ,'k',3); 
    % hold on;

    axis([-40 300 -250 250 -50 400]);
    cameratoolbar('SetCoordSys','x');
    cameratoolbar('SetMode','orbit');
    cameratoolbar;
    pause(0.1);

    end
end

if Atheta2 <0
    for theta2=0:-0.1*pi:Atheta2
        clf


    A=[1 0 0 0;
       0 1 0 0;
       0 0 1 0;
       0 0 0 1];   
    pris=Apris;
    t1=denavit(pi/2,pris,0,pi/2);
    t2=denavit(theta1,pris2+90,0,0);
    t21=denavit(theta1,0,0,0);
    t3=denavit(pi,0,0,pi/2);
    t4=denavit(theta2,150,0,0);

    T1=t1
    T1_2=t1*t21;
    T2=t1*t2
    T3=T2*t3
    T4=T3*t4

    %------------------------- STL -----------------------


    base=Load_STL('BASE.STL');
    base_sr1=Load_STL('BASE SR1.STL');
    base_pr=Load_STL('BASAE PR.STL');
    base_r2=Load_STL('BASE R2.STL');
    base_final=Load_STL('FINAL.STL');

    H=eye(4);
    Aa=[1 0 0 -37.4;
       0 1 0 -35;
       0 0 1 -20;
       0 0 0 1];  

    TR1=[1 0 0 -30;
       0 1 0 -30;
       0 0 1 -36;
       0 0 0 1]; 

    TR2=[1 0 0 -30;
       0 1 0 -30;
       0 0 1 5;
       0 0 0 1]; 

    TR3=[1 0 0 -30;
       0 1 0 -15;
       0 0 1 -40;
       0 0 0 1];  

    TR4=[1 0 0 -30;
       0 1 0 -30;
       0 0 1 22;
       0 0 0 1]; 

    TTR=T1*TR1;
    TTR2=T1_2*TR2;
    TTR3=T2*TR3;
    TTR4=T4*TR4;
    eslabon_STL(Aa,base,'w');
    eslabon_STL(TTR,base_sr1,'w');
    eslabon_STL(TTR2,base_pr,'w');
    eslabon_STL(TTR3,base_r2,'w');
    eslabon_STL(TTR4,base_final,'w');
    camlight('left')



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


    P0=[A(13) A(14) A(15)];
    P1=[0 0 250];
    P21=[200 0 pris];
    P2=[T1(13) T1(14) T1(15)];
    P3=[T2(13) T2(14) T2(15)];
    P4=[T3(13) T3(14) T3(15)];
    P5=[T4(13) T4(14) T4(15)];

    % dibujar_linea(P0,P1 ,'C',3); 
    % hold on;
    % dibujar_linea(P0,P2 ,'C',3); 
    % hold on;
    % dibujar_linea(P21,P3 ,'b',3); 
    % hold on;
    % dibujar_linea(P2,P3 ,'b',3); 
    % hold on;
    % dibujar_linea(P4,P5 ,'k',3); 
    % hold on;

    axis([-40 300 -250 250 -50 400]);
    cameratoolbar('SetCoordSys','x');
    cameratoolbar('SetMode','orbit');
    cameratoolbar;
    pause(0.1);

    end
end

