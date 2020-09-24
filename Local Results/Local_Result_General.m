function evap = Local_Result_General(T,P,RH,dmody)
    ABST = T + 273;
    %ABSTA = Te + 273;
    D12 = 4.14*exp(0.0061*ABST)*10^-6; % T is in terms of Kelvin, coefficient in terms of m^2/s
    Psat = exp(20.386-5132/ABST)*133.32; %N/M^2
    %Psate = exp(20.386-5132/ABSTA)*133.32; %N/M^2
    P1 = RH * Psat;
    %P1e = RHe * Psate;
    M2 = 29;
    M1 = 18;
    m1s = P1/(P*(M2/M1)-P1*(1-M2/M1));
    disp(m1s);
    %m1e = P1e/(P*(M2/M1)-P1e*(1-M2/M1));
    m2 = 1-m1s;
    Mavg = (m1s/M1+m2/M2)^-1;
    rhos = P/(8.314/Mavg)/ABST;
    %rhoe = P/(8.314/Mavg)/ABSTA;
    evap = -rhos*D12/(1-m1s)*dmody;
end
