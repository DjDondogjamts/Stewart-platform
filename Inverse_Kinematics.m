%Parameters
clear all;
clc;
%Angles
x=0;
y=0;
z=0;
 
%Points on the Base coordinates of bottom platform
a1=[13.5, 76.4,   0]; 
a2=[-13.5, 76.4,  0]; 
a3=[-72.9, -26.5, 0]; %a3
a4=[-59.4, -49.88,0];%a4
a5=[59.4, -49.88, 0]; %
a6=[72.9, -26.5,  0];%a4
   
%Points on the top platform %L3 vs L6 L1vs L2 L4vs L5

b1=[32.53,  34.9,  0];
b2=[-32.53, 34.9,  0];
b3=[-46.48 ,10.72  0];
b4=[-13.96, -45.62,0];
b5=[13.96, -45.62, 0];
b6=[46.48, 10.72,  0];
 
%Home Position zero position
P=[0, 0, 210]; %initial position 214.3055 middle y 
 
%Rotational Matrix-0.5655 
vec_y=linspace(-0.5655, 0.5655, 31);
vec_x=linspace(-0.539,  0.539,  31);
vec_z=linspace(-1.395,  1.395,  31); %+10 to -10 deg 0.18600 max limit

counter=0;
for i=0:1:30
    j=i+1;
    counter=counter+1;
        %z=0;
        z=vec_x(counter); %
        Rz=[cos(z) -sin(z)   0;
            sin(z) cos(z)   0;
             0       0      1];
 
    y=0;%     0.5655rad -32.4   32.4degree
    %y=vec_y(counter);
    Ry=[cos(y)  0    sin(y);
        0       1        0; 
        -sin(y) 0   cos(y)];
   

  % x=vec_x(counter); %x is -0.687   0.539 rad ______-39.36   30.9 deg 25.15 l3l1l2l6
    x=0.0;
    Rx=[1       0               0;
        0       cos(x)         -sin(x); 
        0       sin(x)         cos(x);];
    

    
    R=Ry*Rx*Rz; %whole rotational matrix
 %lengh vector position   
%[ R1_1*b1 + R2_1*b2 + R3_1*b3, R1_2*b1 + R2_2*b2 + R3_2*b3, R1_3*b1 + R2_3*b2 + R3_3*b3]
% 25.15         -22.13

Pb1=b1*R+P;
Pb2=b2*R+P;
Pb3=b3*R+P;
Pb4=b4*R+P;
Pb5=b5*R+P;
Pb6=b6*R+P;

L1(j)=sqrt((Pb1(1)-a1(1))^2+(Pb1(2)-a1(2))^2+(Pb1(3)-a1(3))^2); %116min-166 160-400
L2(j)=sqrt((Pb2(1)-a2(1))^2+(Pb2(2)-a2(2))^2+(Pb2(3)-a2(3))^2);
L3(j)=sqrt((Pb3(1)-a3(1))^2+(Pb3(2)-a3(2))^2+(Pb3(3)-a3(3))^2);
L4(j)=sqrt((Pb4(1)-a4(1))^2+(Pb4(2)-a4(2))^2+(Pb4(3)-a4(3))^2);
L5(j)=sqrt((Pb5(1)-a5(1))^2+(Pb5(2)-a5(2))^2+(Pb5(3)-a5(3))^2);
L6(j)=sqrt((Pb6(1)-a6(1))^2+(Pb6(2)-a6(2))^2+(Pb6(3)-a6(3))^2);



 [max(L1) max(L2) max(L3) max(L4) max(L5) max(L6)]
 [min(L1) min(L2) min(L3) min(L4) min(L5) min(L6)]

end
 
% %Time and Time Step
s=2/31; %31 different angle
t=0:s:1.99; 
figure;
%Plotting L(t) 
plot(t,L1)
hold on
plot(t,L2)
plot(t,L3)
plot(t,L4)
plot(t,L5)
plot(t,L6)
title('Variation of the Length in Time')
xlabel('Time [s]')
ylabel('Length Variation [mm]')
legend('L1', 'L2', 'L3', 'L4', 'L5', 'L6')
text(0.6,170, 'x=0, y=-0.5655 to 0.5655 rad z=139.4', 'Color', 'black')
%text(0.8,168, 'g(x) = 5*sin(x)+5', 'Color', 'black')

% %Velosities
% v1(1)=(L1(2)-L1(1))/s;
% v2(1)=(L2(2)-L2(1))/s;
% v3(1)=(L3(2)-L3(1))/s;
% v4(1)=(L4(2)-L4(1))/s;
% v5(1)=(L5(2)-L5(1))/s;
% v6(1)=(L6(2)-L6(1))/s;
%  
% for k=2:1:31
%     v1(k)=(L1(k)-L1(k-1))/s;
%     v2(k)=(L2(k)-L2(k-1))/s;
%     v3(k)=(L3(k)-L3(k-1))/s;
%     v4(k)=(L4(k)-L4(k-1))/s;
%     v5(k)=(L5(k)-L5(k-1))/s;
%     v6(k)=(L6(k)-L6(k-1))/s;
% end
 
% %Plotting v(t) 
% figure;
% plot(t,v1);
% hold on
% plot(t,v2);
% plot(t,v3);
% plot(t,v4);
% plot(t,v5);
% plot(t,v6);
% title('Variation of the Velosity');
% xlabel('Time [s]');
% ylabel('Velosity Variation [mm/s]');
% legend('v1', 'v2', 'v3', 'v4', 'v5', 'v6');
% clear all;
% clc;
% R = sym ('R', [3 3])
% b = sym ('b', [1 3])
% Pb1=b*R

%  clear all;
%  clc;
%  
%  Rx = sym ('Rx', [3 3])
%  Ry = sym ('Ry', [3 3])
%  Rz = sym ('Rz', [3 3])
%  R=Rz*Ry*Rx

