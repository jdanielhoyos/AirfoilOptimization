function [Cl, Cd] = XfoilTool(Re,alpha,nodes,iter,visc)

            check2=strcmp(string(nodes),"320");
            if check2==true
                Cl=0.1;
                Cd=0.1;
                
            else
            check1 = strcmp(string(visc),"On"); %check viscous On
            
            % Output name file 
            file = ['Re=', char(string(Re)), '_angle=', char(string(alpha)), '_n', nodes, '.txt'];
            %Generate input file that runs xfoil    
            file_id = fopen('input.txt', 'w');   
            fprintf(file_id,'PLOP\nG\n\n');
            fprintf(file_id,'load AirfoilCoordinates.dat\n');
            fprintf(file_id, 'ppar \n');
            fprintf(file_id, ['n ' nodes '\n \n \n']);
            fprintf(file_id, 'oper \n');
            fprintf(file_id, 'iter \n');
            fprintf(file_id, [iter '\n']);
            if check1 == 1
            fprintf(file_id, 'visc \n');
            fprintf(file_id, [char(string(Re)) '\n']); %INIT TOGGLE BL INITIALIZATION FLAG
            else
            fprintf(file_id, 'Re \n');
            fprintf(file_id, [char(string(Re)) '\n']); 
            end
            fprintf(file_id, 'SEQP \n');
            fprintf(file_id, 'pacc \n'); 
            fprintf(file_id, [file '\n \n']);
            fprintf(file_id, ['ALFA ' char(string(alpha)) '\n']);
            fclose(file_id);            
            fclose all;
            [~,~] = system('xfoil.exe < input.txt'); 
            if exist(file,'file')
            else
                a=1;
            end
            res_file_id = fopen(file);            
            data = textscan(res_file_id,'%s %s %s %s %s','Headerlines',12,'Collectoutput',1,'Delimiter','');
            fclose(res_file_id);

            delete(file);       
            delete('input.txt');
            fclose all;
            try
                Cl_f = data{:}{1};
                if (alpha < 10)
                    Cl = double(string(Cl_f(9:16)));
                else
                    Cl = double(string(Cl_f(10:16)));
                end
                Cd_f = data{:}{1};
                Cd = double(string(Cd_f(19:25)));
                
            catch

                [Cl, Cd] = XfoilTool(Re,alpha,char(string(double(string(nodes))+10)),iter,visc);        

            end

            end
end
