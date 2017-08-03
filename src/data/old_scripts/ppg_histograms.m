clear all
load('data_raw_ppg_224m_to_compare_fmri.mat')
%files = who;
load('file_groups.mat') %files_A,files_A1,files_A2,files_BC,files_D,files_E

HRV_tot_A=[];
for i=1:length(files_A)
    outfilename=files_A{i};
    ppg = eval(outfilename);   
    [pks,locs] = findpeaks(ppg,'MinPeakDistance',300);
    HRV = diff(locs); 
    %concatenate
    HRV_tot_A = [HRV_tot_A HRV'];
end  
% %% A1
% HRV_tot=[];
% for i=1:length(files_A)
%     outfilename=files_A{i};
%     ppg = eval(outfilename);   
%     [pks,locs] = findpeaks(ppg,'MinPeakDistance',300);
%     HRV = diff(locs); 
%     %concatenate
%     HRV_tot = [HRV_tot resampled_HRV'];
% end  
% 
% %% A2
% HRV_tot=[];
% for i=1:length(files_A)
%     outfilename=files_A{i};
%     ppg = eval(outfilename);   
%     [pks,locs] = findpeaks(ppg,'MinPeakDistance',300);
%     HRV = diff(locs); 
%     %concatenate
%     HRV_tot = [HRV_tot resampled_HRV'];
% end  

%% BC

HRV_tot_BC=[];
for i=1:length(files_BC)
    outfilename=files_BC{i};
    ppg = eval(outfilename);   
    [pks,locs] = findpeaks(ppg,'MinPeakDistance',300);
    HRV = diff(locs); 
    %concatenate
    HRV_tot_BC = [HRV_tot_BC HRV'];
end  
%% D

HRV_tot_D=[];
for i=1:length(files_D)
    outfilename=files_D{i};
    ppg = eval(outfilename);   
    [pks,locs] = findpeaks(ppg,'MinPeakDistance',300);
    HRV = diff(locs); 
    %concatenate
    HRV_tot_D = [HRV_tot_D HRV'];
end  
%% E

HRV_tot_E=[];
for i=1:length(files_E)
    outfilename=files_E{i};
    ppg = eval(outfilename);   
    [pks,locs] = findpeaks(ppg,'MinPeakDistance',300);
    HRV = diff(locs); 
    %concatenate
    HRV_tot_E = [HRV_tot_E HRV'];
end  




%% Plotting
figure;
hist(HRV_tot_A,50);xlim([300 1100]);ylim([0 1800])
[a,b]=hist(HRV_tot_A,50);
figure;
bar(b,a./5);xlim([300 1100]);ylim([0 250])

figure;
hist(HRV_tot_BC,50);xlim([300 1100]);ylim([0 1800])
[a,b]=hist(HRV_tot_BC,50);
figure;
bar(b,a./16);xlim([300 1100]);ylim([0 250])

figure;
hist(HRV_tot_D,50);xlim([300 1100]);ylim([0 1800])
[a,b]=hist(HRV_tot_D,50);
figure;
bar(b,a./2);xlim([300 1100]);ylim([0 250])

figure;
hist(HRV_tot_E,50);xlim([300 1100]);ylim([0 1800])
[a,b]=hist(HRV_tot_E,50);
figure;
bar(b,a./15);xlim([300 1100]);ylim([0 250])




HRV_tot=[];
for i=1:length(files)
    outfilename=files{i};
    ppg = eval(outfilename);   
    [pks,locs] = findpeaks(ppg,'MinPeakDistance',300);
    HRV = diff(locs); 
    var_HRV = var(HRV)
    %concatenate
    HRV_tot = [HRV_tot HRV'];
end  
var_HRV_tot = var(HRV_tot)


%% Plotting
figure;
hist(HRV_tot,50);xlim([300 1100]);ylim([0 1800])
[a,b]=hist(HRV_tot,50);
figure;
bar(b,a./5);xlim([300 1100]);ylim([0 250])



%% VARIANCES

%A
tot=  7.3241e+03
499.3691
2.7440e+03
262.0449
718.4172
828.3761
%B
tot = 8.8204e+03

1.5191e+03
1.8298e+04
1.4294e+04
365.7069
374.8151
1.7297e+03
253.2869
75.6210
2.6502e+04
300.5626
820.2454
1.8280e+03
1.1673e+03
135.3992
62.5067
95.4750
405.5337
%C
tot = 4.0327e+03
1.3453e+04
152.1609
542.3030
257.7233
645.1368
823.9319
93.3255
181.4447
514.7666
242.4538
61.7042
218.9066
1.0744e+03
598.8946
48.8548
59.7819
%D
tot = 193.9010
1.8259e+04
51.3169
1.6994e+03
9.3747e+03
%E
tot = 4.7786e+03 
1.6994e+03
229.7778
1.1584e+03
2.5965e+03
991.5653
142.3797
250.4008
174.7058
282.1072
534.3607
531.3678
267.6014
855.8329
420.8375
1.2466e+03
491.4670
2.3997e+04