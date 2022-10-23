  function LD= effnaca(x)
  global EFFI

iaf.t=num2str(x(1));
iaf.m=num2str(x(2));
iaf.p=num2str(x(3));
iaf.n=25;
iaf.HalfCosineSpacing=1;
iaf.wantFile=0;
iaf.datFilePath='./'; % Current folder
iaf.is_finiteTE=1;
af = naca4gen(iaf);
X=af.x;
Y=af.z;

alpha    = 5; %Angle of attack degress
Re       = 200000; % number of Re    
nodes    = '200'; % Top and bottom surfaces nodes
iter     = '200'; % simulation number of iterations
visc     = 'On';  %Active viscotity (On/Off)
%Cl       = zeros(length(alpha),length(Re)); % generate Cl matrix
%Cd       = zeros(length(alpha),length(Re)); % generate Cd matrix
fileID   = fopen('AirfoilCoordinates.dat','w');
    for i = 1 : length(X)  
        if i == 1
        fprintf(fileID,'New Airfoil\n');
        end
        fprintf(fileID,'%f   %f\n',X(i),Y(i));
    end 
    % if the file is succesfuly created XfoilTool will be available 
    % to run with the set operatign conditions, where rows are the angles
    % of attack and columns the Re     
    if exist('AirfoilCoordinates.dat','file')
        plot(X,Y)
        axis equal
        xlim([0 1])
        ylim([-0.2 0.3]) 
        drawnow
        [Cl, Cd] = XfoilTool(Re,alpha,nodes,iter,visc);

    else
		
    end
LD=Cd/Cl;
EFFI= [EFFI, 1/LD];
length(EFFI)

  end