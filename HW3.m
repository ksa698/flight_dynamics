%% Flight D HW 3 Kiara Alvarez ksa698
%h=altitude
h=[0:1000:80000];
%constants
    rho_s=2.3769E-3;
    rho_t=7.0613E-4;
    rho_p=1.7083E-4;
    ht=36089;
    h_p=65617;
for i=1:length(h)
    if (0<=h(i)) && (h(i)<= 36089)
        t(i)=518.69-3.5662E-3*(h(i));
        %p(i)=1.1376E-11.*t(i).^5.2560;
        rho(i)=6.627E-15*t(i)^4.2560;
    elseif (36089<h(i)) && (h(i)<= 65617)
        %t(i)=389.99;
        p(i)=2678.4*exp(-4.8063E-5*h(i));
        rho(i)=1.4939E-6*p(i);
    else
        t(i)=389.99+(h(i)-65617)*5.4864E-4;
        %p(i)=3.7930E90.*t(i).^-34.164;
        rho(i)=2.2099E87*t(i)^-35.164;
    end
end

for j=1:length(h)
    if h(j) <= 36089
        rho_e(j)=rho_s*exp(-h(j)/29730);
    elseif (36089<h(j)) && (h(j)<= 65617)
        rho_e(j)=rho_t*exp(-(h(j)-ht)/20806);
    else
        rho_e(j)=rho_p*exp(-(h(j)-h_p)/20770);

    end
end

figure
plot(h,rho,'k','linewidth',1.5)
hold on
plot(h,rho_e,'r--','linewidth',1.5)
legend('"True" \rho', 'Exponential \rho','location','southoutside')
xlabel('Altitude h')
ylabel('\rho')
title('#4 Atmospheric Density \rho')


% Finding error
error=abs(((rho-rho_e)./rho).*100);
figure
plot(h,error,'r','linewidth',2)
xlabel('Altitude h')
ylabel('Percent Error')
title('#4 Accuracy of \rho')
