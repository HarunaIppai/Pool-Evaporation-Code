function evap = Local_Results_Pressure(Ta,Tw,Pw_minus_Pa,V)
    % The correcting factor for V=0.101 is 0.233
    % V = 0.194 0.257
    % V = 0.308 0.31
    Pa = 1000000;
    Pw = Pw_minus_Pa + Pa;
    L = 1;
    ABST = Tw;
    ABSTA = Ta;
    D12 = 4.14*exp(0.0061*ABST)*10^-6; % T is in terms of Kelvin, coefficient in terms of m^2/s
    P1 = Pw;
    P1e = Pa;
    M2 = 29;
    M1 = 18;
    m1 = P1/(Pw*(M2/M1)-P1*(1-M2/M1));
    m1s = m1;
    m1e = P1e/(Pw*(M2/M1)-P1e*(1-M2/M1));
    m2 = 1-m1;
    Mavg = (m1/M1+m2/M2)^-1;
    rho = Pw/(8.314/Mavg)/ABST;
    Sc = 0.62;
    rhoe = Pw/(8.314/Mavg)/ABSTA;
    rhos = rho;
    nyu = Sc*D12;
    g = 9.81;
    Gr = g*(rhoe-rhos)*L^3/rho/nyu^2;
    Ram = Gr*Sc;
    Sh = Ram^(1/3);
    gs = rho*D12*Sh/L;
    B = (m1s - m1e)/(1 - m1s);
    gogs = 0.2581*V + 0.2069
    evap = B*gs*gogs;

end