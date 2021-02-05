%% HW 5 Problem 3   Kiara Alvarez ksa698
%Constants
rho=0.000889;
V=696.3;
mu=3.107E-7;
M=0.7;
% B=Fueslage, W=Wing, H=Horiz, V=Vert, N=Nacelle, T=Tip
%Values
ldN=7.7/2.3;
    ldT=14/1.75;
    ldB=41/5.25;
    tcV=0.1;
    tcH=0.08;
    tcW=0.09;
ln=7.7;
    lt=14;
    lb=41;
    cw=7;
    ch=3.83;
    cv=6.92;
SwN=55.6;
    SwT=61.2;
    SwW=344;
    SwH=108;
    SwV=75.4;
    SwB=456;
    
%interference factors
IFK=1.5;
    IFT=1.25;
    IFB=1.2;
    IFW=1.2;
    IFH=1.1;
    IFV=1.1;
    
%Nacelle  (body)   
Ren=(rho*V*ln)/mu;
Cfk=0.455/(log10(Ren)^2.58);
CFK=(1+.2*M^2)^-.467;
FFN=1+(.35)/(ldN);
    fkN=Cfk*CFK*IFK*FFN*SwN;
%Tip tank
Ret=(rho*V*lt)/mu;
Cft=0.455/(log10(Ret)^2.58);
FFT=1+60/(ldT)^3+0.0025*(ldT);
    fkT=Cft*CFK*IFT*FFT*SwT;
%Body
Reb=(rho*V*lb)/mu;
Cfb=0.455/(log10(Reb)^2.58);
FFB=1+60/(ldB)^3+0.0025*(ldB);
    fkB=Cfb*CFK*IFB*FFB*SwB;
%wing
Rew=(rho*V*cw)/mu;
Cfw=0.455/(log10(Rew)^2.58);
FFW=1+1.6*(tcW)+100*(tcW)^4;
    fkW=Cfw*CFK*IFW*FFW*SwW;
%horizontal tail
Reh=(rho*V*ch)/mu;
Cfh=0.455/(log10(Reh)^2.58);
FFH=1+1.6*(tcH)+100*(tcH)^4;
    fkH=Cfh*CFK*IFH*FFH*SwH;
%vertical
Rev=(rho*V*cv)/mu;
Cfv=0.455/(log10(Rev)^2.58);
FFV=1+1.6*(tcV)+100*(tcV)^4;
    fkV=Cfv*CFK*IFV*FFV*SwV;
    
%add em all up
fk=(2*fkN)+(2*fkT)+fkB+fkW+fkH+fkV;
Cd=(1.1/232)*fk;
    fprintf('Zero Lift Drag Coefficient: %6.4f \n',Cd)
