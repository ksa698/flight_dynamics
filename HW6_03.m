%% HW 6 Problem 3 Finding F(distance factor), G(time factor)
%constants
ro=0.00073654; CD0=0.022332; K=0.073; CD=0.02911; R=1716.5;
h=35000;
W=11000;
V=(650/5280)*3600;
%Values found from HW 5 Problem 5
n=0.925; %eta
T=1050.8; %thrust

%Find mach and CD0
    t=518.69-3.5662E-3*(h);
    ts=518.69;
    a=sqrt(1.4*R*t);
    M=V/a;
    ma=[0.6 0.7]; %gives CD0=0.022332;
%Find theta 
    t_=t*(1+0.2*M^2);
    theta=t_/ts; %rad
        deg=theta*180/pi;  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%Corrected Thrust 
%please ignore this section, just for my sanity
    %finding delta 
%     p=1.1376E-11*t^5.2560;
%     ps=2116.2;
%     p_=p*(1+0.2*M^2)^3.5;
%     press_rat=p_/ps;   
% t_c1=[1365 1337];
% t_c2=[1974 1947];
% interp1(ma,t_c1,M);   %ans 1345.9
% interp1(ma,t_c2,M);   %ans 1955.6
% eta=[0.9 0.95];
% new_tc=[1345.9 1955.6];
% interp1(eta,new_tc,n);
%Tc= interpolated value
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Corrected Specific Fuel Consumption Cc
    c_c1=[1.184 1.190];
    c_c2=[1.127 1.129];
    interp1(ma,c_c1,M); 
    interp1(ma,c_c2,M);  
    new_cc=[1.1881 1.1284];
    %interp1(ma,new_cc,M);
    %Cc=1.1474;
    eta=[0.9 0.95];
    interp1(eta,new_cc,n); 
    Cc=1.1582;

%% CHECK VALUES pg 102
%chart looks like F=0.4, G=0.00095
%F and G
    %T=Tc*press_rat;
    C=Cc*sqrt(theta);
    F=V/(C*T); %ans 0.40947195
    G=1/(C*T); %ans 0.00092394
fprintf('Distance Factor F [mi/lb] is: %6.8f \n', F)
fprintf('Time Factor G [lb/hr] is: %6.8f \n', G)

    
    