%FILTRO_PASO_BANDA Aplica un filtro paso banda,
%
%       FILTRO_PASO_BANDA(X,FS,FMIN,FMAX): Aplica un filtro paso banda
%       a la se?al X entre las frecuencias de paso fmin y fmax utilizando
%       una frecuencia de muestreo Fs.
%

function XFilt=filtro_paso_banda(X,Fs,fmin,fmax)

%     if(nargin<2 || isempty(Fs))
%         Fs=200;
%     end
%     
%      filtrar=1;
%     if(nargin<3 || (nargin<4 && isempty(fmin)) ||(isempty(fmin) && isempty(fmax)))
%         filtrar=0;
%         error('Debes de especificar la banda de frecuencias en la que se desea filtrar');
%     end
    
%     if(fmin<0.5 || fmin>Fs/2)
%         fmin=0;
%     end
% 
%     if  fmax>(Fs/2-0.5)
%         fmax=Fs/2-0.5;
%     end
%         
%     if(fmin>fmax)
%         aux=fmin;
%         fmin=fmax;
%         fmax=aux;
%     end
    
    N = 5; % Orden
   [ns,num_channels]=size(X);
   if ns<3*N
       N=floor(ns/3);
   end
        
    
%     if fmin==0
%          Fstop1 = 0.0001; % Primera frecuencia de corte
%          Fpass1 = 0.001; % Primera Frecuencia de paso
% elseif fmin<0.5
        Fstop1 =fmin- 0.001; % Primera frecuencia de corte
        Fpass1 = fmin; % Primera Frecuencia de paso
%     else
%         Fstop1 =fmin- 0.5; % Primera frecuencia de corte
%         Fpass1 = fmin; % Primera Frecuencia de paso   
%     end

    Fpass2 = fmax; % Segunda Frecuencia de paso
    Fstop2 = fmax+0.005; % Segunda frecuencia de corte
    Wstop1 = 10; % Peso de la primera frecuencia de corte
    Wpass = 1; % Peso del la banda de paso
    Wstop2 = 10; % Peso de la segunda frecuencia de corte
    dens = 20; % Factor de densidad

    % Calculamos los coeficiente4s del filtro usando la funcion FIRPM.
    b = firpm(N, [0 Fstop1 Fpass1 Fpass2 Fstop2 Fs/2]/(Fs/2), [0 0 1 1 0 0], [Wstop1 Wpass Wstop2], {dens});
    Hd = dfilt.dffir(b);
    XFilt = filtfilt(b,1,X);
    

end


