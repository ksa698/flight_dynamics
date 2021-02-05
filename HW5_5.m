%% HW 5 Problem 5 Power Setting Calculation
%constants
h=35000;
ro=0.00073654;
CD0=0.023;
K=0.073;
CD=0.02911; %interpolated value
S=232;
W=11000;
V=650;
R=1716.5;

%Calculating nmax=min(1.05, 1/sqrt(theta)
t=518.69-3.5662E-3*(h); %temperature
ts=518.69;
a=sqrt(1.4*R*t);
M=V/a;
t_=t*(1+0.2*M^2);
theta=t_/ts; %rad
min_pos=1/sqrt(theta);
nmax=1.05;
fprintf('Nmax=min(1.05, 1/sqrt(theta)) second value is %6.4f \n',min_pos)
fprintf('\n')
fprintf('Since 1.05 is the true minimum Nmax=1.05 \n')

%Calculating n
%from table 3.5 pg 84
%using M=0.668112088059479
p=1.1376E-11*t^5.2560;
ps=2116.2;
p_=p*(1+0.2*M^2)^3.5;
press_rat=p_/ps;
%Thrust Calculation T=D/2
D=0.5*CD*ro*S*V^2;
T=D/2; %Why? T=D is total, only need for 1 engine
Tc=T/press_rat; %value says 3355 if CD0...Tc=3386.7

%Table 3.5 M=0.6681 Tc=1677.5
%0.6  1365/1974   0.9/0.95
%0.7  1337/1947   0.9/0.95

ma=[0.6 0.7];
t_c1=[1365 1337];
t_c2=[1974 1947];
interp1(ma,t_c1,0.6681); %ans 1345.9
interp1(ma,t_c2,0.6681);   %ans 1955.6

new_tc=[1345.9 1955.6];
eta=[0.9 0.95];
interp1(new_tc,eta,1677.5); %ans 0.92719

%Power Setting
n=0.92719; %actually eta
P=n/nmax;
fprintf('\n')
fprintf('Using the interpolated value N=0.92719 Power Setting is: %6.4f \n', P)



