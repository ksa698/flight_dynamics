%% Problem 4 ISBJ Flight Envelope
%flight envelope for ideal subsonic business jet (ISBJ)
%powered by 2 GE turbojets (pg 86, 90, 124)
%height vs velocity plane
%bound by graph of 
    %eqn T-D=0; 
    %stall speed (CLmax=1.24);
    %speed limited by max dynamic pressure q_bar max=300
    %speed limit by max mach number Mmax=0.81
    %similar to fig 4.2 pg 98 for SBJ not ISBJ
    %check altitude stuff on pg 60
%constants
P=0.98; W=11000; K=0.073; CL_max=1.24; gamma=1.4; M_max=0.81; R=1716.49; q_max=300; CD0=0.023; S=232;
%thrust constants
Tt=710; Ct=1.18; b=0.1; %based on Power setting
n=0.925; %corrected engine speed
ps=2116.2;
pt=7.0613E-4;
%Route 1: interpolation to find Tc
        ma=[0.8 0.9];
        t_c1=[1309 1281];
        t_c2=[1921 1894];
        interp1(ma,t_c1,M_max);   
        interp1(ma,t_c2,M_max);  
        eta=[0.9 0.95];
        new_tc=[1306.2 1918.3];
        interp1(eta,new_tc,n);
        Tc=1612.3;  



%% From HW 3
h=(0:1000:60000);
%constants
    rho_s=2.3769E-3;rho_p=1.7083E-4;ht=36089;h_p=65617;
V_max=[];
dyn_p_V=[];
L_V=[]; %lift velocity

for i=1:length(h)
    if (0<=h(i)) && (h(i)<= 36089)
        t(i)=518.69-3.5662E-3*(h(i));
        rho(i)=6.627E-15*t(i)^4.2560;
        temp(i)=518.69-h(i)*3.5662E-3;
        a=1.2;
    elseif (36089<h(i)) && (h(i)<= 65617) %tropopause
        p(i)=2678.4*exp(-4.8063E-5*h(i));
        rho(i)=1.4939E-6*p(i);
        temp(i)=389.99;
        a=1;
  % Finding Thrust (mach=.81) pg 84
            %p_(i)=rho(i)*(1+0.2*M_max^2)^3.5;
            %press_rat(i)=p_(i)/ps;
            %T_(i)=Tc*press_rat(i); 
    else
        t(i)=389.99+(h(i)-65617)*5.4864E-4;
        rho(i)=2.2099E87*t(i)^-35.164;
        temp(i)=389.99+(5.4864E-4)*(h(i)-65617);
        a=1;

    end
%Equation parameters
        V_max=[V_max,M_max*sqrt(gamma*R*temp(i))]; 
        dyn_p_V=[dyn_p_V, sqrt(2*q_max/rho(i))];
        L_V=[L_V, sqrt((2*W)/(CL_max*rho(i)*S))];
        T(i)=2*Tt*(rho(i)/pt)^a;
    %Finding T-D=0 (section 5.2)
    V_star(i)=sqrt((2*W)/(rho(i)*S)*sqrt(K/CD0));
    D(i)=((1/2)*CD0*rho(i)*S*V_star(i)^2)+((2*K*W^2)/(S*rho(i)*V_star(i)^2));
    ratio(i)=T(i)/D(i);
    u(i)=sqrt(ratio(i)+sqrt(ratio(i)^2-1));
    u2(i)=sqrt(ratio(i)-sqrt(ratio(i)^2-1));
    V_1(i)=u(i)*V_star(i); 
    V_2(i)=u2(i)*V_star(i);
end
%% T-D plotting limits
V_LHS=V_1(1:47); 
    h_l=h(1:47); 
V_RHS=V_2(1:47); 
    h_r=h(1:47);

figure
plot(V_max,h,'linewidth',1)
hold on
grid on
xlim([0,1000])
plot(dyn_p_V,h,'--','linewidth',1)
plot(L_V, h,'--','linewidth',1)
%plot(V_2,h,'linewidth',1)
%plot(V_1,h,'linewidth',1)
plot(V_LHS,h_l,'linewidth',1)
plot(V_RHS,h_r,'linewidth',1)

legend('Vmax Mach #', 'Vmax Dynamic Pressure', 'V Stall Speed','T-D','T-D','location','northwest')
ylabel('Altitude [ft]')
xlabel('Velocity [ft/s]')
title('ISBJ Flight Envelope')

