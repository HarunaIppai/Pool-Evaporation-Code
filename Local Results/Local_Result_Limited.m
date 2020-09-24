function evap = Local_Result_Limited(Te,RHe,T,P,RH,L)

    ABST = T + 273;
    ABSTA = Te + 273;
    D12 = 4.14*exp(0.0061*ABST)*10^-6; % T is in terms of Kelvin, coefficient in terms of m^2/s
    Psat = exp(20.386-5132/ABST)*133.32; %N/M^2
    Psate = exp(20.386-5132/ABSTA)*133.32; %N/M^2
    P1 = RH * Psat;
    P1e = RHe * Psate;
    M2 = 29;
    M1 = 18;
    m1 = P1/(P*(M2/M1)-P1*(1-M2/M1));
    m1s = m1;
    m1e = P1e/(P*(M2/M1)-P1e*(1-M2/M1));
    m2 = 1-m1;
    Mavg = (m1/M1+m2/M2)^-1;
    rho = P/(8.314/Mavg)/ABST;
    Sc = 0.62;
    rhoe = P/(8.314/Mavg)/ABSTA;
    rhos = rho;
    nyu = Sc*D12;
    g = 9.81;
    Gr = g*(rhoe-rhos)*L^3/rho/nyu^2;
    Ram = Gr*Sc;
    Sh = Ram^(1/3);
    gs = rho*D12*Sh/L;
    B = (m1s - m1e)/(1 - m1s);
    disp(Gr);
    evap = B*gs;

end

