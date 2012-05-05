% Matlab summary

% Vectors

v = [3 1 4 2];

vTranspose = v';

pas = 0.25;
range = -1:pas:2;

subV = range(1:2:5); % carful, first index is 1, not 0


u = v(1:3) - v(2:4);

x = 0: -1: -3; % 0 -1 -2 -3

elementWiseProduct = v .* x; % also ./


% Matrices

u = [1 2];
A = [u; u]; % each u is a row
A2 = [u' u']; % each u' is a column
% Actually it is just vertical / horizontal concatenation!

A3 = A * A2; % dimensions must agree
A3 = A * u'; 

subA = A(1:2, 1:2);

B = inv(A);
[v, e] = eig(A);

Z = zeros(1, 5); % Z = [0 0 0 0 0];
% ones / rand (uniform) / randn (normal)


% Functions 
% function [y1, y2] = myFunction(x1, x2)
% y1 = x1;
% y2 = x2;


% Script
for i = 1:4 
    v(i) = i; % try to avoid for loops
end

i = 1
while(i < 4)
    i = i+1;
end

if(1<2)
    disp('1<2');
elseif(1==2)
    disp('1=2');
else
    dip('1>2');
end


% Various tricks

ans; % last result

whos; % what is defined

f = @(t) 3*t+4; % define a short function

help help;

clear;

format long; % or short => way to display numbers