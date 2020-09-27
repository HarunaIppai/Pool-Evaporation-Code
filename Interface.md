#Interface from the result of Spalding model to visualization
This document serves as the instruction of how to use the functions in *Local Results* Folder
##File Structure
There are four files in the folder *Local Results*, Corresponding to different functions. Inside the folder
*Local_Results* is the function that returns both **Limited Solution** and **General Solution**. It is generally not used unless a comparison of two equation is needed. It should not be used right now
*Local_Results_General* is the function that returns **General Solution** and should be used in a high blow rate. Use it in lower blow rate when you know what you are doing. It should not be used right now.
*Local_Results_Limited* is the function that returns **Limited Solution** and should be used in lower blow rate. It is not accurate in higher blow rate. It should not be used right now.
*Local_Results_Pressure* is the function that returns **Limited Solution** with correction factor. The input of this function is optimized for Raimundo's experimental data and the traditional model and is used in the comparison
##Function Return and its variables
