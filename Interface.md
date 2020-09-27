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

**Input**: <br>
Te: Environment Temperature, in C <br>
RHe: Environment relative Humidity, in unit 1<br>
T: Water Temperature, in C<br>
P: Air pressure, in Pa<br>
RH: Surface relative humidity, in unit 1<br>
dmody: Vapor diffusion gradient, in g/m<br>
L: Characteristic length, any input other than zero is fine<br>

**Return**: <br>
The function returns the general solution and limited solution (sequentially in an array) evaporation rate in `g/(s m^2)`<br>

`Local_Result_Limited(Te,RHe,T,P,RH,L)`

**Input**: <br>
Te: Environment Temperature, in C <br>
RHe: Environment relative Humidity, in unit 1<br>
T: Water Temperature, in C<br>
P: Air pressure, in Pa<br>
RH: Surface relative humidity, in unit 1<br>
L: Characteristic length, any input other than zero is fine<br>

**Return**: <br>
The function returns the limited solution (sequentially in an array) of evaporation rate in `g/(s m^2)`<br>

`Local_Result_General(T,P,RH,dmody)`

**Input**: <br>
T: Water Temperature, in C<br>
P: Air pressure, in Pa<br>
RH: Surface relative humidity, in unit 1<br>
dmody: Vapor diffusion gradient, in g/m<br>

**Return**: <br>
The function returns the general solution (sequentially in an array) of evaporation rate in `g/(s m^2)`<br>

`Local_Results_Pressure(Ta,Tw,Pw_minus_Pa,V)`

**Input**: <br>
Ta: Ambient Temperature, in K<br>
Tw: Water Temperature, in K<br>
Pw_minus_Pa: Pressure difference, in Pa<br>
V: Flow speed, in m/s<br>

**Return**: <br>
The function returns the limited solution of evaporation rate in `g/(s m^2)`<br>

## Other Notes
It is highly recommended to use _Local_Results_Pressure_ since other functions are not fitted and their result is off.
