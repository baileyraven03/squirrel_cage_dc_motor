%% Below I use the parameters given and calculate to graphically plot the motor-torque-speed and stator-current-speed charictaristics over a slip range from 1 to 0.048
%% Date 02/03/2024
%% Written by Bailey Raven

%% Initial Decalrations and Calculations
Vs = 230; %% Declaring the supply phase voltage (V)
fs = 50; %% Declaring the supply frequency (Hz)
Rr = 0.8; %% Declaring the rotor resistance (ohm's)
Rs = 0.8; %% Declaring the stator resistance (ohm's)
Xeq = 5.69; %% Declaring the equivalent impedance (H)
s = linspace(1, 0.048, 100); %% Declaring slip as a range from 1 to 0.048, with a spacing of 0.01
Ns = 1500;  %% Delaring the synchronous speed (rpm)
wr = (2*pi.*(Ns.*(1.-s)))./60; %% Calculating an angular rotor speed (rad\s) for the varying slip from 1 down to 0
Nr = Ns.*(1.-s); %% Calculating the range of rotor speeds for the varying slip (rpm)
Lm = 0.637; %% Declaring a magnetic inductance (H)
Im = Vs/(2*pi*fs*Lm); %% Calculating a magnetising current (A)
R_total = Rs+(Rr./s); %% Calculating the total resistance, based off of both the rotor and stator resistances (ohm's)

%% Plotting the stator curretn vs the motor speed
Ir = Vs./((R_total.^2)+Xeq^2).^(1/2);  %% Calculating the rotor current for the varying slip (A)
Is = Im + Ir; %% Calculating the stator current (A)
figure() %% Creating a figure
plot(Nr, Is) %% Plotting the rotor speed on the x-axis & stator current on the y-axis
title("Stator current vs rotor speed") %% Titling the graph
xlabel("Rotor speed (rpm)") %% Labling the x-axis
ylabel("Stator current (A)") %% Labling the y-axis
legend("Stator current (A)") %% Creating a legend for labling the line
grid on  %% Turning on the grid

%% Plotting the motor torque vs the rotor speed
Td = (3.*Ir.^2*Rr.*(1-s))./(wr.*s);  %% Calculating the motor torque (Nm)
figure() %% Creating a figure
plot(Nr, Td, "r") %% Plotting the rotor speed on the x-axis and motor torque on the y-axis, with a red line
title("Motor torque vs rotor speed") %% Titling the graph
xlabel("Rotor speed (rpm)")  %% Labling the x-axis
ylabel("Motor torque (Nm)")  %% Labling the y-axis
legend("Motor torque (Nm)")  %% Creating a legend to label the line
grid on  %% Turning on the grid





