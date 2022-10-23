# AirfoilOptimization
Airfoil Optimization by XFOIL and OpenFOAM CFD

PSOMatlab:

Optimize the airfoil parameterized by NACA 4 digits, maximizes CL/CD estimated by XFOIL. The parameters are t, m, p -naca 4 digits numbers-. The recommended lower and upper limits of the design space are [0.08,0,0.2],[0.25,0.095,0.5] -line 6 of PSOMatlab.m-

effnaca.m Lines 16 and 17, you can change the Reynolds and angle of attack parameters.

How XFOIL optimization looks like (given Reynolds, alpha, maximize CL/CD):
https://youtu.be/YMSxT4Lc_5I
Optimal Airfoil Design through Particle Swarm Optimization fed by CFD and XFOIL. Journal of the Brazilian Society of Mechanical Sciences and Engineering.
