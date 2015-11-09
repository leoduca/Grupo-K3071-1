function varargout = Main(varargin)
% MAIN MATLAB code for Main.fig
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
%      applied to the GUI before Main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Main

% Last Modified by GUIDE v2.5 09-Nov-2015 17:42:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Main_OpeningFcn, ...
                   'gui_OutputFcn',  @Main_OutputFcn, ...
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


% --- Executes just before Main is made visible.
function Main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Main (see VARARGIN)

% Choose default command line output for Main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
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
vecFunciones = get(handles.edit1, 'String');
intervalos = get(handles.edit2, 'String');
vecIntervalos = str2num(intervalos);
coeficientes = seriefourier(vecIntervalos, vecFunciones);

set(handles.text8, 'String', strcat('Ao = ', char(coeficientes(1))));
set(handles.text11, 'String', strcat('An = ', char(coeficientes(2))));
set(handles.text12, 'String', strcat('Bn = ', char(coeficientes(3))));


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
syms x t

%Graficar Funcion
clc
axes(handles.axes1);
set(handles.axes1, 'visible', 'on');
cla
A = str2num(get(handles.edit2, 'String'));
f = eval(get(handles.edit1, 'String'));
x = linspace(min(A), max(A), 1000);
fx = 0;
for i=1:length(A)-1
    if mod(i, 2) == 1
    fx = fx+((x>=A(i))&(x<=A(i+1))).*subs(f(i),x);
    else
    fx = fx+((x>A(i))&(x<A(i+1))).*subs(f(i),x);
    end
end
plot(x, fx, 'Linewidth', 2); 
hold off;
grid on;


function calcularError(handles)
%%OBTENGO LA SERIE
vecFunciones = get(handles.edit1, 'String');
intervalos = get(handles.edit2, 'String');
vecIntervalos = str2num(intervalos);
armonicas = str2num(get(handles.edit3, 'String'));
coeficientes = seriefourier(vecIntervalos, vecFunciones);
intervalo = str2num(get(handles.edit2, 'String'));

Ao_2 = coeficientes(1);
An = coeficientes(2);
Bn = coeficientes(3);
wo = coeficientes(4);
syms n t;
%t=linspace (0,2*pi);
serie = Ao_2 + symsum(An*cos(n*wo*t),n,1,armonicas) + symsum(Bn*sin(n*wo*t),n,1,armonicas);
f = eval(get(handles.edit1, 'String'));
f = sym(f);
for i=1:length(f)
    serieCompuesta(i) = f(i) - serie;
    numerador(i) = vpa(int(abs(serieCompuesta(i)), 't',vecIntervalos(i), vecIntervalos(i+1)), 5);
    denominador(i) = vpa(int(abs(f(i)), 't',vecIntervalos(i), vecIntervalos(i+1)), 5);
end
sumNumerador = sum(numerador);
sumDenominador = sum (denominador)
errorPorcentual = round(sumNumerador / sumDenominador * 100);
set(handles.text15, 'String', strcat(strcat('Error: ', char(errorPorcentual), '%')));
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

function armonicasErrorMenorA5(handles)
vecFunciones = get(handles.edit1, 'String');
intervalos = get(handles.edit2, 'String');
vecIntervalos = str2num(intervalos);
coeficientes = seriefourier(vecIntervalos, vecFunciones);
intervalo = str2num(get(handles.edit2, 'String'));

Ao_2 = coeficientes(1);
An = coeficientes(2);
Bn = coeficientes(3);
wo = coeficientes(4);
syms n t;
%t=linspace (0,2*pi);
errorPorcentual = 6.00;
armonicas = 1; 
while (errorPorcentual>5.00)
    serie = Ao_2 + symsum(An*cos(n*wo*t),n,1,armonicas) + symsum(Bn*sin(n*wo*t),n,1,armonicas);
    f = eval(get(handles.edit1, 'String'));
    f = sym(f);
    for i=1:length(f)
        serieCompuesta(i) = f(i) - serie;
        numerador(i) = vpa(int(abs(serieCompuesta(i)), 't',vecIntervalos(i), vecIntervalos(i+1)), 5);
        denominador(i) = vpa(int(abs(f(i)), 't',vecIntervalos(i), vecIntervalos(i+1)), 5);
    end
    sumNumerador = sum(numerador);
    sumDenominador = sum (denominador)
    errorPorcentual = round(sumNumerador / sumDenominador * 100);
    armonicas = armonicas + 1 ;
    if (armonicas > 30)
        set(handles.text16, 'String', 'Para que e<5% las armonicas se pasan de 50!' );
       msg = 'Para que e<5% las armonicas se pasan de 50!';
       error(msg);
       break;
    end
end
    set(handles.text16, 'String', strcat('Armonicas e<5%:  ', num2str(abs(armonicas))));

%%OBTENGO FX ORIGINAL

%x = linspace(min(A), max(A), 1000);
% fx = 0;
% for i=1:length(A)-1
%     if mod(i, 2) == 1
%     fx = fx+((x>=A(i))&(x<=A(i+1))).*subs(f(i),x);
%     else
%     fx = fx+((x>A(i))&(x<A(i+1))).*subs(f(i),x);
%     end
% end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%GRAFICO LA SERIE%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vecFunciones = get(handles.edit1, 'String');
intervalos = get(handles.edit2, 'String');
armonicas = str2num(get(handles.edit3, 'String'));
vecIntervalos = str2num(intervalos);
coeficientes = seriefourier(vecIntervalos, vecFunciones);

chequearArmonica(armonicas, handles);

clc
axes(handles.axes2);
set(handles.axes2, 'visible', 'on');
cla

Ao_2 = coeficientes(1);
An = coeficientes(2);
Bn = coeficientes(3);
wo = coeficientes(4);
syms n;
t = linspace (min(vecIntervalos), max(vecIntervalos))
%t=linspace (-2*pi,2*pi);
%t = linspace(min(intervalos), max(intervalos), 1000);
serie = Ao_2 + symsum(An*cos(n*wo*t),n,1,armonicas) + symsum(Bn*sin(n*wo*t),n,1,armonicas);

plot(t, serie); 
hold off;
grid on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CALCULO COEFICIENTES An%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
axes(handles.axes3);
set(handles.axes3, 'visible', 'on');
cla

Ao_2 = coeficientes(1);
An = coeficientes(2);
Bn = coeficientes(3);
wo = coeficientes(4);

coeficientesAn=1:armonicas;
syms n;
for i=1:armonicas,
    coeficientesAn(i)= subs(An,i);
end

stem(coeficientesAn); 
hold off;
grid on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CALCULO COEFICIENTES Bn%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
axes(handles.axes4);
set(handles.axes4, 'visible', 'on');
cla

coeficientesBn=1:armonicas;
syms n;
for i=1:armonicas,
    coeficientesBn(i)= subs(Bn,i);
end

stem(coeficientesBn); 
hold off;
grid on;

calcularError(handles);

% --- Executes on button press in pushbutton5.
%%function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%GRAFICO DE LOS COEFICIENTES
% 
% vecFunciones = get(handles.edit1, 'String');
% intervalos = get(handles.edit2, 'String');
% armonicas = str2num(get(handles.edit3, 'String'));
% vecIntervalos = str2num(intervalos);
% coeficientes = seriefourier(vecIntervalos, vecFunciones);
% 
% chequearArmonica(armonicas, handles);
% clc
% axes(handles.axes3);
% set(handles.axes3, 'visible', 'on');
% cla
% 
% Ao_2 = coeficientes(1);
% An = coeficientes(2);
% Bn = coeficientes(3);
% wo = coeficientes(4);
% 
% coeficientesAn=1:armonicas;
% syms n;
% for i=1:armonicas,
%     coeficientesAn(i)= subs(An,i);
% end
% 
% stem(coeficientesAn); 
% hold off;
% grid on;
% 
% %COEFICIENTES Bn
% clc
% axes(handles.axes4);
% set(handles.axes4, 'visible', 'on');
% cla
% 
% coeficientesBn=1:armonicas;
% syms n;
% for i=1:armonicas,
%     coeficientesBn(i)= subs(Bn,i);
% end
% 
% stem(coeficientesBn); 
% hold off;
% grid on;
%  


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CHEQUEO SI ME PASO DE 50%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function chequearArmonica(armonicas, handles)
if (armonicas > 50)
   set(handles.text14, 'String', 'La cantidad de armonicas no puede ser mayor a 50!' );
   msg = 'La cantidad de armonicas no puede ser mayor a 50!';
   error(msg);
else
    set(handles.text14, 'String', strcat('Cantidad de coeficientes: ', num2str(armonicas)));
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
    armonicasErrorMenorA5(handles);
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
