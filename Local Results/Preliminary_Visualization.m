format long;
clear all;
close all;

raimundo = readtable('raimundo.txt');


%J_Spalding = zeros(28,1)

raimundo.J_Spalding = zeros(28,1);
for i=1:28
   raimundo.J_Spalding(i) = Local_Results_Pressure(raimundo.Ta(i), raimundo.Tw(i), raimundo.VPD(i), raimundo.V(i)); 
end

data = table2array(raimundo);

exp_data = data(:,1:5);
spalding = [data(:,1:4) data(:,8)];

matrix = [exp_data; spalding];
group = strings(56,1);
group(1:28) = 'Raimundo Data';
group(29:56) = 'Spalding Model';

figure
labels = {'Air Speed (m/s)', 'Air Temperature (K)', 'Water Temperature (K)', 'Vapor Pressure Deficit (Pa)', 'Evaporation Rate (g/(m^2 s))'};
[h,ax] = gplotmatrix(matrix, [], group, 'br', '*s', [], [], 'variable', labels)


figure
scatter3(raimundo.V, raimundo.Tw, raimundo.VPD, 50, raimundo.J_exp)
hold on
scatter3(raimundo.V, raimundo.Tw, raimundo.VPD, 40, raimundo.J_Spalding, '*')
hold off
xlabel('Air Speed (m/s)')
ylabel('Water Temperature (K)')
zlabel('Vapor Pressure Deficit (Pa)')
cb = colorbar;                                     % create and label the colorbar
cb.Label.String = 'Evaporation Rate (g/(m^2 s))';
legend('Raimundo Data', 'Spalding Model')

