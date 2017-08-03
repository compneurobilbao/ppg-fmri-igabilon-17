%addtopath /data


files = dir('*.log');
for file = files'
    outfilename=file.name(1:end-4)
    fid=fopen(file.name);
    fidw=fopen(outfilename,'wb');
    i=0;
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
    load(outfilename);
    x = eval(outfilename);
    %ppg = x(:,5);
    marks = x(:,10);
    marks_20 = find(marks==20);
    try
        ppg = x(marks_20(end)-224699:marks_20(end),5);
        assignin('base',outfilename,ppg)
    catch
        %%            
    end
    delete(outfilename)
end





% 
% %% just ppg
% load('data_raw_all.mat')
% 
% files = who;
% for i=1:length(files)
%     outfilename=files{i};
% x = eval(outfilename);
% x = x(:,5);
% assignin('base',outfilename,x)
% end
% %save them