%% HW 5 Problem 4 Graphing
V=[100:20:900];
%Constants
    CD=0.023; K=0.073; L=11000; S=232;
%alt values 10,000 25000 35000
    rho10=0.0017553; rho25=0.0010651; rho35=0.00073654;
%preallocating memory
D_10=zeros(size(V)); D_25=zeros(size(V)); D_35=zeros(size(V));
    D_10p=size(D_10); D_25p=size(D_10); D_35p=size(D_10);
        D_10i=size(D_10); D_25i=size(D_10); D_35i=size(D_10);
    

for i=1:length(V)
%part a
    D_10(i)=(0.5*CD*rho10*S*V(i)^2)+((2*K*L^2)/(rho10*S*V(i)^2));
    D_25(i)=(0.5*CD*rho25*S*V(i)^2)+((2*K*L^2)/(rho25*S*V(i)^2));
    D_35(i)=(0.5*CD*rho35*S*V(i)^2)+((2*K*L^2)/(rho35*S*V(i)^2));
%part b
%parasite
        D_10p(i)=(0.5*CD*rho10*S*V(i)^2);
        D_25p(i)=(0.5*CD*rho25*S*V(i)^2);
        D_35p(i)=(0.5*CD*rho35*S*V(i)^2);
%induced
        D_10i(i)=((2*K*L^2)/(rho10*S*V(i)^2));
        D_25i(i)=((2*K*L^2)/(rho25*S*V(i)^2));
        D_35i(i)=((2*K*L^2)/(rho35*S*V(i)^2));
%part c is parasite, induced, and total for alt=35,000
end

figure
plot(V,D_10,'k','linewidth',1.5)
hold on
plot(V,D_25,'r','linewidth',1.5)
plot(V,D_35,'g','linewidth',1.5)
grid on
legend('\rho=10,000', '\rho=25,000', '\rho=35,000','location','southoutside')
xlabel('Velocity [ft/s]')
ylabel('Drag [lb]')
title('Problem 4a SBJ Total Drag')

figure
plot(V,D_10p,'k','linewidth',1.5)
hold on
plot(V,D_25p,'r','linewidth',1.5)
plot(V,D_35p,'g','linewidth',1.5)
grid on
legend('\rho=10,000', '\rho=25,000', '\rho=35,000','location','southoutside')
xlabel('Velocity [ft/s]')
ylabel('Drag [lb]')
title('Problem 4b SBJ Parasite Drag')

figure
plot(V,D_10i,'k','linewidth',1.5)
hold on
plot(V,D_25i,'r','linewidth',1.5)
plot(V,D_35i,'g','linewidth',1.5)
grid on
legend('\rho=10,000', '\rho=25,000', '\rho=35,000','location','southoutside')
xlabel('Velocity [ft/s]')
ylabel('Drag [lb]')
title('Problem 4b SBJ Induced Drag')

figure
plot(V,D_35,'k','linewidth',1.5)
hold on
plot(V,D_35p,'r','linewidth',1.5)
plot(V,D_35i,'g','linewidth',1.5)
grid on
legend('\rho=10,000', '\rho=25,000', '\rho=35,000','location','southoutside')
xlabel('Velocity [ft/s]')
ylabel('Drag [lb]')
title('Problem 4c SBJ Total vs Parasite vs Induced Drag')