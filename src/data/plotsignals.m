function plotsignals(filename,outfilename)
%filename='prueba.log';
%outfilename='pruebaa.log';

fid=fopen(filename);
fidw=fopen(outfilename,'wb');
tline = fgets(fid);
while ischar(tline)
    if strncmpi(tline,'#',1)
        tline = fgets(fid);
        continue;
    end
    fprintf(fidw,'%s',tline);
    tline = fgets(fid);
end
fclose(fid);
fclose(fidw);
data=load(outfilename);

t=0:(size(data,1)-1);
t=t./(500*60);

figure;
subplot(2,1,1)
plot(t,data(:,1));
title('v1raw')
xlabel('minutos');
subplot(2,1,2)
plot(t,data(:,2));
title('v2raw')
xlabel('minutos');

figure;
subplot(2,1,1)
plot(t,data(:,3));
title('v1')
xlabel('minutos');
subplot(2,1,2)
plot(t,data(:,4));
title('v2')
xlabel('minutos');

figure;
plot(t,data(:,5));
title('ppu')
xlabel('minutos');

figure;
plot(t,data(:,6));
title('resp')
xlabel('minutos');

end