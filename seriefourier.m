function coeficientes = seriefourier(A, f)
syms t n
%A = [0 2*pi];
%f = [t^2];

f = sym(f);
T = max(A)-min(A);
wo = 2*pi/(T);

Ao = 0;
for i=1:length(f)
   Ao = Ao +int(f(i),'t', A(i), A(i+1));
end
Ao = simple(Ao/T);

An = 0;
for i=1:length(f)
   An = An +int(f(i)*cos(n*wo*t), A(i), A(i+1));
end
An = simple(2*An/T);


Bn = 0;
for i=1:length(f)
   Bn = Bn +int(f(i)*sin(n*wo*t), A(i), A(i+1));
end
Bn = simple(2*Bn/T);


An = char(An);
Bn = char(Bn);

An = simple(sym(strrep(char(An), 'sin(pi*n)', '0')));
Bn = simple(sym(strrep(char(Bn), 'sin(pi*n)', '0')));

An = simple(sym(strrep(char(An), 'cos(pi*n)', '(-1)^n')));
Bn = simple(sym(strrep(char(Bn), 'cos(pi*n)', '(-1)^n')));

An = simple(sym(strrep(char(An), 'sin(n*pi)', '0')));
Bn = simple(sym(strrep(char(Bn), 'sin(n*pi)', '0')));

An = simple(sym(strrep(char(An), 'cos(n*pi)', '(-1)^n')));
Bn = simple(sym(strrep(char(Bn), 'cos(n*pi)', '(-1)^n')));

An = simple(sym(strrep(char(An), 'sin(2*pi*n)', '0')));
Bn = simple(sym(strrep(char(Bn), 'sin(2*pi*n)', '0')));

An = simple(sym(strrep(char(An), 'cos(2*pi*n)', '1')));
Bn = simple(sym(strrep(char(Bn), 'cos(2*pi*n)', '1')));

An = simple(sym(strrep(char(An), 'cos(2*n*pi)', '1')));
Bn = simple(sym(strrep(char(Bn), 'cos(2*n*pi)', '1')));
% 

coeficientes(1) = Ao;
coeficientes(2) = An;
coeficientes(3) = Bn;

%set(handles.text8, 'String', strcat('Ao = ', char(Ao)));
%set(handles.text11, 'String', strcat('An = ', char(An)));
%set(handles.text12, 'String', strcat('Bn = ', char(Bn)));