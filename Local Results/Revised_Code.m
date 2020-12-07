function evap = Revised_Code(Ta,Tw,Pw_minus_Pa,V)
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
    Sh = 0.14*Ram^(1/3);
    gs = rho*D12*Sh/L;
    B = (m1s - m1e)/(1 - m1s);
    % for boelter with consideration of temperature it is
    % 0.09738*ABST-22.5756 instead of constant 1.8. The possible
    % explanation is that Raimundo's experiment does not cover a high
    % temperature range
    gogs = 1.8*log(1+B)/B+0.156*V/gs/B;
    evap = B*gs*gogs;

end
