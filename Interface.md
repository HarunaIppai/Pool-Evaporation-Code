# Interface from the result of Spalding model to visualization
This document serves as the instruction of how to use the functions in *Local Results* Folder
## File Structure
There are four files in the folder *Local Results*, Corresponding to different functions. Inside the folder 

*Local_Results* is the function that returns both **Limited Solution** and **General Solution**. It is generally not used unless a comparison of two equation is needed. It should not be used right now

*Local_Results_General* is the function that returns **General Solution** and should be used in a high blow rate. Use it in lower blow rate when you know what you are doing. It should not be used right now.

*Local_Results_Limited* is the function that returns **Limited Solution** and should be used in lower blow rate. It is not accurate in higher blow rate. It should not be used right now.

*Local_Results_Pressure* is the function that returns **Limited Solution** with correction factor. The input of this function is optimized for Raimundo's experimental data and the traditional model and is used in the comparison

## Function Return and its variables

`Local_Results(Te,RHe,T,P,RH,dmody,L)`

**Input**: 
Te: Environment Temperature, in C
RHe: Environment relative Humidity, in unit 1
T: Water Temperature, in C
P: Air pressure, in Pa
RH: Surface relative humidity, in unit 1
dmody: Vapor diffusion gradient, in g/m
L: Characteristic length, any input other than zero is fine

**Return**: 
The function returns the general solution and limited solution (sequentially in an array) evaporation rate in `g/(s m^2)`

`Local_Results_Pressure(Ta,Tw,Pw_minus_Pa,V)`

**Input**: 
Ta: Ambient Temperature, in K
Tw: Water Temperature, in K
Pw_minus_Pa: Pressure difference, in Pa
V: Flow speed, in m/s

**Return**: 
The function returns the evaporation rate in `g/(s m^2)`

