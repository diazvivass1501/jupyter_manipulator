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

% Last Modified by GUIDE v2.5 15-Nov-2022 11:23:42

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


axes(handles.imgJupyter);
imgJupyterPNG = imread('jupiter.png');
imshow(imgJupyterPNG);

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
Apris2=str2double(get(handles.Prismatico2,'String'))-90;
Atheta22=str2double(get(handles.Rotacional2,'String'));
Atheta2=(Atheta22)*(pi/180);
disp(Apris);
disp(Atheta1);
disp(Apris2);
disp(Atheta2);

%a=arduino()
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
if Apris>0 && Apris<160 && Atheta1>=0 && Atheta1<90 && Apris2>0 && Apris2<210 && Atheta2>=0 && Atheta2<180

%% geomatrico

    x=Apris2+90;
    y=(L3+L4)*sin(Atheta1);
    z=Apris+((L3+L4)*cos(Atheta1));

   R=rotacion_z(pi/2)*rotacion_x(pi/2)*rotacion_z(Atheta1)*rotacion_x(-pi/2)*rotacion_z(pi)*rotacion_z(Atheta2);

    A= [ 1     0     0     x;
         0     1     0     y;
         0     0     1     z;
         0     0     0     1];
     GEO=A*R;
%% denavith    
    for pris=0:10:Apris
        cla
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
    %arduino  primer movimiento
    % Mov1=(200*pris)/8;
    % writeDigitalPin(a,'D40',0);
    % for i=0:1:Mov1
    %     writeDigitalPin(a,'D39',1);
    %     writeDigitalPin(a,'D38',1);
    %     pause(0.0005)
    %     writeDigitalPin(a,'D38',0);
    %     pause(0.0005)
    % end
    % writeDigitalPin(a,'D40',1);
    % 
    % 

    %-----------------Primera Articulacion Rotacional -------------------------
    for theta1=0:0.1*pi:Atheta1
        cla

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

    T1=t1;
    T1_2=t1*t21;
    T2=t1*t2;
    T3=T2*t3;
    T4=T3*t4;

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
        cla
            cla
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

    T1=t1;
    T1_2=t1*t21;
    T2=t1*t2;
    T3=T2*t3;
    T4=T3*t4;


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
            cla


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

        T1=t1;
        T1_2=t1*t21;
        T2=t1*t2;
        T3=T2*t3;
        T4=T3*t4;
        denavit_final=t1*t2*t3*t4
        GEO=T4
   

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
            cla


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

        T1=t1;
        T1_2=t1*t21;
        T2=t1*t2;
        T3=T2*t3;
        T4=T3*t4;
        denavit_final=t1*t2*t3*t4

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
    

    set(handles.tablaDenavit,'data',denavit_final);
    set(handles.tablageometrico,'data',GEO);

else
    errordlg( "LOS VALORES INGRESADOS NO SON VALIDOS O ESTÁN PROVOCANDO UN CHOQUE");
    disp("error")
end

