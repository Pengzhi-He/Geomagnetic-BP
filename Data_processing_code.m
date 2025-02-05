%Data Set
Path = 'The storage path of the file'; %Supplementary data 1
Number of Blood Pressure measurements = xlsread([Path,'\Source Data'],1,'C3:C74');  
Number of Blood Pressure measurements Male = xlsread([Path,'\Source Data'],1,'D3:D74');  
Number of Blood Pressure measurements Female= xlsread([Path,'\Source Data'],1,'E3:E74');  
Number of individuals with hypertension = xlsread([Path,'\Source Data'],1,'F3:F74');  
Number of individuals with hypertension Male= xlsread([Path,'\Source Data'],1,'G3:G74');  
Number of individuals with hypertension Female= xlsread([Path,'\Source Data'],1,'H3:H74');  

SBP = xlsread([Path,'\Source Data'],1,'I3:I74');  
SBP_Male = xlsread([Path,'\Source Data'],1,'J3:J74'); 
SBP_Female = xlsread([Path,'\Source Data'],1,'K3:K74'); 
DBP = xlsread([Path,'\Source Data'],1,'L3:L74'); 
DBP_Male = xlsread([Path,'\Source Data'],1,'M3:M74'); 
DBP_Female = xlsread([Path,'\Source Data'],1,'N3:N74'); 

SBP_Qingdao = xlsread([Path,'\Source Data'],1,'O3:O74');  
SBP_Male_Qingdao = xlsread([Path,'\Source Data'],1,'P3:P74'); 
SBP_Female_Qingdao = xlsread([Path,'\Source Data'],1,'Q3:Q74'); 
DBP_Qingdao = xlsread([Path,'\Source Data'],1,'R3:R74');  
DBP_Male_Qingdao = xlsread([Path,'\Source Data'],1,'S3:S74'); 
DBP_Female_Qingdao = xlsread([Path,'\Source Data'],1,'T3:T74'); 

SBP_Weihai = xlsread([Path,'\Source Data'],1,'U3:U74');  
SBP_Male_Weihai = xlsread([Path,'\Source Data'],1,'V3:V74'); 
SBP_Female_Weihai = xlsread([Path,'\Source Data'],1,'W3:W74'); 
DBP_Weihai = xlsread([Path,'\Source Data'],1,'X3:X74');  
DBP_Male_Weihai = xlsread([Path,'\Source Data'],1,'Y3:Y74'); 
DBP_Female_Weihai = xlsread([Path,'\Source Data'],1,'Z3:Z74'); 

Ap = xlsread([Path,'\Source Data'],1,'AA3:AA74');
Air Temp_Qingdao = xlsread([Path,'\Source Data'],1,'AB3:AB74');
Air Temp_Weihai = xlsread([Path,'\Source Data'],1,'AC3:AC74');
PM25_Qingdao = xlsread([Path,'\Source Data'],1,'AD3:AD74');
PM25_Weihai = xlsread([Path,'\Source Data'],1,'AE3:AE74');

Weekly Ap = xlsread([Path,'\Source Data'],2,'B3:B74');
Weekly SBP = xlsread([Path,'\Source Data'],2,'C3:C74');
Weekly DBP = xlsread([Path,'\Source Data'],2,'D3:D74');

Ap_std_max2fold = xlsread([Path,'\Source Data'],3,'B35:M35');
Ap_std_min2fold = xlsread([Path,'\Source Data'],3,'B36:M36');
SBP_std_max2fold = xlsread([Path,'\Source Data'],3,'B11:M11');
SBP_std_min2fold = xlsread([Path,'\Source Data'],3,'B12:M12');
DBP_std_max2fold = xlsread([Path,'\Source Data'],3,'B23:M23');
DBP_std_min2fold = xlsread([Path,'\Source Data'],3,'B24:M24');

t = 1:1:72;

%%Figure 1

subplot(3,1,1)
title('Group All','FontSize',18)
semilogy(t,Number of Blood Pressure measurements,'k-',t,Number of individuals with hypertension,'k--','LineWidth',1.5)
xticks([1 6 12 18 24 30 36 42 48 54 60 66 72]); xlim([0 73]);
ylim([350 17500]);
xticklabels([]);

subplot(3,1,2)
title('Group Male','FontSize',18)
semilogy(t,Number of Blood Pressure measurements Male,'b-',t,Number of individuals with hypertension Male,'b--','LineWidth',1.5)
ylabel('Number of blood pressure physical examinations (solid line) and hypertension (dashed line)','FontSize',11)
xticks([1 6 12 18 24 30 36 42 48 54 60 66 72]); xlim([0 73]);
ylim([200 10500]);
xticklabels([]);

subplot(3,1,3)
title('Group Female','FontSize',18)
semilogy(t,Number of Blood Pressure measurements Female,'r-',t,Number of individuals with hypertension Female,'r--','LineWidth',1.5)
xticks([1 6 12 18 24 30 36 42 48 54 60 66 72]); 
xlim([0 73]); ylim([110 11000]);
xticklabels({' ','6','12','6','12','6','12','6','12','6','12','6','12'})
text(1,399-349,'Year','HorizontalAlignment','center','FontSize',10,'LineWidth',1.2)
text(6,260-210,'2015','HorizontalAlignment','center','FontSize',12)
text(18,296-246,'2016','HorizontalAlignment','center','FontSize',12)
text(30,367-317,'2017','HorizontalAlignment','center','FontSize',12)
text(42,390-340,'2018','HorizontalAlignment','center','FontSize',12)
text(54,485-435,'2019','HorizontalAlignment','center','FontSize',12)
text(66,561-511,'2020','HorizontalAlignment','center','FontSize',12)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Figure 2
subplot(3,2,1)
plot(t,Ap(1:12),'--',t,Ap(13:24),'--',t,Ap(25:36),'--',t,Ap(37:48),'--',t,Ap(49:60),'--',t,Ap(61:72),'--','LineWidth',0.8)
hold on
plot(t,Ap_value,'k','LineWidth',2)
Y_up3 = Ap_std_max2fold;
Y_down3 = Ap_std_min2fold;
hold on
patch([Y fliplr(Y)],[Y_down3 fliplr(Y_up3)],'k','facecolor',[.8 .8 .8],'EdgeColor','white')
h1 = legend('2015','2016','2017','2018','2019','2020','average value')
set(h1,'Orientation','horizon')
set(h1,'Box','off')
xticklabels([]);
ylabel('Ap index/nT')

subplot(3,2,3)
plot(t,SBP(1:12),'--',t,SBP(13:24),'--',t,SBP(25:36),'--',t,SBP(37:48),'--',t,SBP(49:60),'--',t,SBP(61:72),'--','LineWidth',0.8)
hold on
plot(t,SBP_value,'k','LineWidth',2)
xlim([1,12])
Y_up1=SBP_std_max2fold;
Y_down1=SBP_std_min2fold;
hold on
patch([Y fliplr(Y)],[Y_down1 fliplr(Y_up1)],'k','facecolor',[.8 .8 .8],'EdgeColor','white')
ylabel('Systolic BP/mmHg')
xticklabels([]);

subplot(3,2,5)
plot(t,DBP(1:12),'--',t,DBP(13:24),'--',t,DBP(25:36),'--',t,DBP(37:48),'--',t,DBP(49:60),'--',t,DBP(61:72),'--','LineWidth',0.8)
hold on
plot(t,DBP_value,'k','LineWidth',2)
xlim([1,12])
Y_up2=DBP_std_max2fold;
Y_down2=DBP_std_min2fold;
hold on
patch([Y fliplr(Y)],[Y_down2 fliplr(Y_up2)],'k','facecolor',[.8 .8 .8],'EdgeColor','white')
xlabel('Month')
ylabel('Diastolic BP/mmHg')

%Supplementary data 2

SBP_value = (SBP(1:12)+SBP(13:24)+SBP(25:36)+SBP(37:48)+SBP(49:60)+SBP(61:72))/6

DBP_value = (DBP(1:12)+DBP(13:24)+DBP(25:36)+DBP(37:48)+DBP(49:60)+DBP(61:72))/6

Ap_value = (Ap_0(1:12)+Ap_0(13:24)+Ap_0(25:36)+Ap_0(37:48)+Ap_0(49:60)+Ap_0(61:72))/6


Ap_move = smoothdata(Ap,'movmean',36)

Detrended Ap = Ap-Ap_move

subplot(3,2,2)
plot(t,Ap,'g-',t,Detrended Ap,'g:','LineWidth',1.5)
ylabel('Ap index/nT','FontSize',11)
hl_2 = legend('Ap','Detrended Ap')
set(hl_2,'Orientation','horizon')
set(hl_2,'Box','off')
xticks([1 6 12 18 24 30 36 42 48 54 60 66 72]); xlim([0 73]);
xticklabels([])

subplot(3,2,4)
plot(t,SBP,'k-',t,SBP_Male,'b-',t,SBP_Female,'r-','LineWidth',1.5)
ylabel('Systolic BP/mmHg','FontSize',11)
hl = legend('Group All','Group Male','Group Female')
set(hl,'Orientation','horizon')
set(hl,'Box','off')
xticks([1 6 12 18 24 30 36 42 48 54 60 66 72]); xlim([0 73]);
xticklabels([])
hold on
yyaxis right
bar(SBP_Male-SBP_Female)
ylim([0,100]); yticks([0 20]); yticklabels({'0','20'})
ylabel('Blue minus Red','FontSize',9)
ylabel('Blue minus Red','Rotation',-90)

subplot(3,2,6)
plot(t,DBP,'k:',t,DBP_Male,'b:',t,DBP_Female,'r:','LineWidth',1.5)
xlabel('Month','FontSize',11)
ylabel('Diastolic BP/mmHg','FontSize',11)
hl_1 = legend('Group All','Group Male','Group Female')
set(hl_1,'Orientation','horizon')
set(hl_1,'Box','off')
xticks([1 6 12 18 24 30 36 42 48 54 60 66 72]); xlim([0 73]);
xticklabels({' ','6','12','6','12','6','12','6','12','6','12','6','12'})
text(1,75.16-9.2,'Year','HorizontalAlignment','center','FontSize',10,'LineWidth',1.2)
text(6,71.33-5.37,'2015','HorizontalAlignment','center','FontSize',11)
text(18,72.05-6.09,'2016','HorizontalAlignment','center','FontSize',11)
text(30,71.52-5.56,'2017','HorizontalAlignment','center','FontSize',11)
text(42,71.73-5.77,'2018','HorizontalAlignment','center','FontSize',11)
text(54,72.6-6.64,'2019','HorizontalAlignment','center','FontSize',11)
text(66,73.56-7.6,'2020','HorizontalAlignment','center','FontSize',11)
hold on
yyaxis right
bar(DBP_Male-DBP_Female)
ylim([0,100]); yticks([0 20]); yticklabels({'0','20'})
ylabel('Blue minus Red','Rotation',-90)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Calculate correlation coefficients and significance levels:
[rho, pval] = corr(Y, X, 'Type', 'Spearman');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Figure 3
Fs = 1;  T = 1/Fs;  N = 72;  t1 = (0:N-1)*T;  %Sampling frequency and period
d1 = [t1;SBP']
d2 = [t1;SBP_Male']
d3 = [t1;SBP_Female']
d4 = [t1;DBP']
d5 = [t1;DBP_Male']
d6 = [t1;DBP_Female']
d7 = [t1;Ap]
d8 = [t1;Detrended Ap]

ys_1 = SBP;
L_1=length(ys_1);  
X_1=fft(ys_1)*2/L_1;  %Fourier Transform of Signal
f_1=Fs/2*linspace(0,1,L_1/2+1); 
X2_1=abs(X_1(1:L_1/2.+1)).^2; 
X2_1_N = normalize(X2_1,'range')

ys_2 = SBP_Male; 
L_2=length(ys_2);  
X_2=fft(ys_2)*2/L_2; 
f_2=Fs/2*linspace(0,1,L_2/2+1); 
X2_2=abs(X_2(1:L_2/2.+1)).^2; 
X2_2_N = normalize(X2_2,'range')

ys_3 = SBP_Female; 
L_3=length(ys_3);         
X_3=fft(ys_3)*2/L_3;   
f_3=Fs/2*linspace(0,1,L_3/2+1); 
X2_3=abs(X_3(1:L_3/2.+1)).^2; 
X2_3_N = normalize(X2_3,'range')

ys_4 = DBP; 
L_4=length(ys_4);    
X_4=fft(ys_4)*2/L_4; 
f_4=Fs/2*linspace(0,1,L_4/2+1); 
X2_4=abs(X_4(1:L_4/2.+1)).^2; 
X2_4_N = normalize(X2_4,'range')

ys_5 = DBP_Male; 
L_5=length(ys_5);  
X_5=fft(ys_5)*2/L_5;  
f_5=Fs/2*linspace(0,1,L_5/2+1); 
X2_5=abs(X_5(1:L_5/2.+1)).^2; 
X2_5_N = normalize(X2_5,'range')

ys_6 = avg_low_women; 
L_6=length(ys_6); 
X_6=fft(ys_6)*2/L_6;  
f_6=Fs/2*linspace(0,1,L_6/2+1); 
X2_6=abs(X_6(1:L_6/2.+1)).^2; 
X2_6_N = normalize(X2_6,'range')

ys_7 = Ap; 
L_7=length(ys_7); 
X_7=fft(ys_7)*2/L_7;  
f_7=Fs/2*linspace(0,1,L_7/2+1); 
X2_7=abs(X_7(1:L_7/2.+1)).^2; 
X2_7_N = normalize(X2_7,'range')

ys_8 = Detrended Ap; 
L_8=length(ys_8);   
X_8=fft(ys_8)*2/L_8;  
f_8=Fs/2*linspace(0,1,L_8/2+1); 
X2_8=abs(X_8(1:L_8/2.+1)).^2; 
X2_8_N = normalize(X2_8,'range')

%Fig. 3a-c
subplot(3,1,1)
plot(1./f_7,X2_7_N,'g-',1./f_8,15*X2_8_N,'g:','LineWidth',1)
xlim([1 72])
legend('Ap','Detrended-Ap')
xticklabels([]);
ylabel('Amplitude','fontweight','bold','FontSize',10)

subplot(3,1,2)
plot(1./f_1,X2_1_N,'k-',1./f_2,X2_2_N,'b-',1./f_3,X2_3_N,'r-',1./f_4,X2_4_N,'k:',1./f_5,X2_5_N,'b:',1./f_6,X2_6_N,'r:','LineWidth',1)
legend('All Systolic BP','Male Systolic BP','Female Systolic BP','All Diastolic BP','Male Diastolic BP','Female Diastolic BP')
xlim([1 72])
ylabel('Amplitude','fontweight','bold','FontSize',10)

subplot(3,1,3)
plot(1./f_1,X2_1_N,'k-',1./f_2,X2_2_N,'b-',1./f_3,X2_3_N,'r-',1./f_4,X2_4_N,'k:',1./f_5,X2_5_N,'b:',1./f_6,X2_6_N,'r:','LineWidth',1)
ylim([0 7])
xlim([2 17])
ylabel('Amplitude','fontweight','bold','FontSize',10)
xlabel('Period (month)','fontweight','bold','FontSize',10)



%Fig. 3d-i
subplot(3,2,1)
xwt(d1,d8)
xticks([6 12 18 24 30 36 42 48 54 60 66 72]);
set(gca,'FontSize',10); xticklabels([])
set(gca,'position',[0.06,0.67,0.35,0.23])
ylabel('Period (month)')
subplot(3,2,2)
xwt(d4,d8)
xticks([6 12 18 24 30 36 42 48 54 60 66 72]);
set(gca,'FontSize',10); xticklabels([])
set(gca,'position',[0.56,0.67,0.35,0.23])
subplot(3,2,3)
xwt(d2,d8)
xticks([6 12 18 24 30 36 42 48 54 60 66 72]);
set(gca,'FontSize',10); xticklabels([])
set(gca,'position',[0.06,0.38,0.35,0.23])
ylabel('Period (month)')
subplot(3,2,4)
xwt(d5,d8)
xticks([6 12 18 24 30 36 42 48 54 60 66 72]);
set(gca,'FontSize',10); xticklabels([])
set(gca,'position',[0.56,0.38,0.35,0.23])
subplot(3,2,5)
xwt(d3,d8)
xticks([1 6 12 18 24 30 36 42 48 54 60 66 72]);
xticklabels({' ','6','12','6','12','6','12','6','12','6','12','6','12'})
text(-0.5,4.63+0.6,'Year','HorizontalAlignment','center','FontSize',10,'LineWidth',1.2)
text(6,2.132+3.098,'2015','HorizontalAlignment','center','FontSize',10)
text(18,3.717+1.513,'2016','HorizontalAlignment','center','FontSize',10)
text(30,4.454+0.776,'2017','HorizontalAlignment','center','FontSize',10)
text(42,4.405+0.825,'2018','HorizontalAlignment','center','FontSize',10)
text(54,3.634+1.596,'2019','HorizontalAlignment','center','FontSize',10)
text(66,1.869+3.361,'2020','HorizontalAlignment','center','FontSize',10)
set(gca,'position',[0.06,0.09,0.35,0.23])
ylabel('Period (month)')
subplot(3,2,6)
xwt(d6,d8)
xticks([6 12 18 24 30 36 42 48 54 60 66 72]);
xticklabels({'6','12','6','12','6','12','6','12','6','12','6','12'})
text(6,2.132+3.098,'2015','HorizontalAlignment','center','FontSize',10)
text(18,3.717+1.513,'2016','HorizontalAlignment','center','FontSize',10)
text(30,4.454+0.776,'2017','HorizontalAlignment','center','FontSize',10)
text(42,4.405+0.825,'2018','HorizontalAlignment','center','FontSize',10)
text(54,3.634+1.596,'2019','HorizontalAlignment','center','FontSize',10)
text(66,1.869+3.361,'2020','HorizontalAlignment','center','FontSize',10)
set(gca,'position',[0.56,0.09,0.35,0.23])
ylabel('Period (month)')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Figure 4

ys_1 = Air Temp_Qingdao;
L_1=length(ys_1);  
X_1=fft(ys_1)*2/L_1;  %Fourier Transform of Signal
f_1=Fs/2*linspace(0,1,L_1/2+1); 
X2_1=abs(X_1(1:L_1/2.+1)).^2; 
X2_1_N = normalize(X2_1,'range')

ys_2 = Air Temp_Weihai; 
L_2=length(ys_2);  
X_2=fft(ys_2)*2/L_2; 
f_2=Fs/2*linspace(0,1,L_2/2+1); 
X2_2=abs(X_2(1:L_2/2.+1)).^2; 
X2_2_N = normalize(X2_2,'range')

ys_3 = PM25_Qingdao; 
L_3=length(ys_3);         
X_3=fft(ys_3)*2/L_3;   
f_3=Fs/2*linspace(0,1,L_3/2+1); 
X2_3=abs(X_3(1:L_3/2.+1)).^2; 
X2_3_N = normalize(X2_3,'range')

ys_4 = PM25_Weihai; 
L_4=length(ys_4);    
X_4=fft(ys_4)*2/L_4; 
f_4=Fs/2*linspace(0,1,L_4/2+1); 
X2_4=abs(X_4(1:L_4/2.+1)).^2; 
X2_4_N = normalize(X2_4,'range')

%Fig. 4a-c
subplot(3,1,1)
plot(t,Air Temp_Qingdao,'k--',t,Air Temp_Weihai,'k:','LineWidth',1.0);
ylabel('Air Temperature/℃')
legend('Qingdao','Weihai','FontSize',10)
xticks([6 12 18 24 30 36 42 48 54 60 66 72]); xticklabels([])
xlim([0 73]);
subplot(3,1,2)
plot(t,PM25_Qingdao,'r--',t,PM_Weihai,'r:','LineWidth',1.0);
ylabel('PM2.5 \mug/m³')
legend('Qingdao','Weihai','FontSize',10)
xticks([6 12 18 24 30 36 42 48 54 60 66 72]);
xticklabels({'6','12','6','12','6','12','6','12','6','12','6','12'})
xlim([0 73]);
subplot(3,1,3)
plot(1./f_1,100*X2_1_N,'k--',1./f_2,100*X2_2_N,'k:',1./f_3,100*X2_3_N,'r--',1./f_4,100*X2_4_N,'r:','LineWidth',1.3)
legend('Qingdao Air Temp','Weihai Air Temp','Qingdao PM2.5','Weihai PM2.5','FontSize',10)
xlim([0 73])
xlabel('Period (month)','fontweight','bold','FontSize',10)
ylabel('Amplitude','fontweight','bold','FontSize',12)

%Fig. 4d-k
Fs = 1;  T = 1/Fs;  N = 72;  t1 = (0:N-1)*T;  %Sampling frequency and period
d9 = [t1;Air Temp_Qingdao']
d10 = [t1;Air Temp_Weihai']
d11 = [t1;PM25_Qingdao']
d12 = [t1;PM25_Weihai']

subplot(4,2,1)
xwt(d9,d1)
xticks([6 12 18 24 30 36 42 48 54 60 66 72]);
set(gca,'FontSize',10); xticklabels([])
ylabel('Period (month)')
subplot(4,2,2)
xwt(d9,d4)
xticks([6 12 18 24 30 36 42 48 54 60 66 72]);
set(gca,'FontSize',10); xticklabels([])
ylabel('Period (month)')
subplot(4,2,3)
xwt(d11,d1)
xticks([6 12 18 24 30 36 42 48 54 60 66 72]);
set(gca,'FontSize',10); xticklabels([])
ylabel('Period (month)')
subplot(4,2,4)
xwt(d11,d4)
xticks([6 12 18 24 30 36 42 48 54 60 66 72]);
set(gca,'FontSize',10); xticklabels([])
ylabel('Period (month)')
subplot(4,2,5)
xwt(d10,d1)
xticks([6 12 18 24 30 36 42 48 54 60 66 72]);
set(gca,'FontSize',10); xticklabels([])
ylabel('Period (month)')
subplot(4,2,6)
xwt(d10,d4)
xticks([6 12 18 24 30 36 42 48 54 60 66 72]);
set(gca,'FontSize',10); xticklabels([])
ylabel('Period (month)')
subplot(4,2,7)
xwt(d12,d1)
xticks([6 12 18 24 30 36 42 48 54 60 66 72]);
set(gca,'FontSize',10); xticklabels({'6','12','6','12','6','12','6','12','6','12','6','12'});
ylabel('Period (month)')
subplot(4,2,8)
xwt(d12,d4)
xticks([6 12 18 24 30 36 42 48 54 60 66 72]);
set(gca,'FontSize',10); xticklabels({'6','12','6','12','6','12','6','12','6','12','6','12'});
ylabel('Period (month)')

