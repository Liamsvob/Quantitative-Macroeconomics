%Pavé Guillaume 	Student number : 16409823
%Svoboda Liam	Student number : 16834509

%%This code is used to plot IRFs.

dynare Q2.mod 
load('Q2_results.mat', 'oo_') 
irf=oo_.irfs; 


irf_A = figure;
subplot(3,3,1);
plot(irf.A_e_A,'black')
hold on;
plot(zeros(length(0:40)),'red');
hold off;
title('A')
subplot(3,3,2);
plot(irf.c_e_A,'black')
hold on;
plot(zeros(length(0:40)),'red');
hold off;
title({'IRFs for a positive realisation of shocks on A','c'})
subplot(3,3,3);
plot(irf.y_e_A,'black')
hold on;
plot(zeros(length(0:40)),'red');
hold off;
title('y')
subplot(3,3,4);
plot(irf.k_e_A,'black')
hold on;
plot(zeros(length(0:40)),'red');
hold off;
title('k')
subplot(3,3,5);
plot(irf.h_e_A,'black')
hold on;
plot(zeros(length(0:40)),'red');
hold off;
title('h')
subplot(3,3,6);
plot(irf.r_e_A,'black')
hold on;
plot(zeros(length(0:40)),'red');
hold off;
title('r')
subplot(3,3,7);
plot(irf.w_e_A,'black')
hold on;
plot(zeros(length(0:40)),'red');
hold off;
title('w')
grid on;
print('Q2.1','-dpdf')
saveas(gcf,'Q2_1.pdf');

irf_theta = figure;
subplot(3,3,1);
plot(irf.theta_e_theta,'black')
hold on;
plot(zeros(length(0:40)),'red');
hold off;
title('Theta')
subplot(3,3,2);
plot(irf.c_e_theta,'black')
hold on;
plot(zeros(length(0:40)),'red');
hold off;
title({'IRF for a negative realisation of shocks on Theta','c'})
subplot(3,3,3);
plot(irf.y_e_theta,'black')
hold on;
plot(zeros(length(0:40)),'red');
hold off;
title('y')
subplot(3,3,4);
plot(irf.k_e_theta,'black')
hold on;
plot(zeros(length(0:40)),'red');
hold off;
title('k')
subplot(3,3,5);
plot(irf.h_e_theta,'black')
hold on;
plot(zeros(length(0:40)),'red');
hold off;
title('h')
subplot(3,3,6);
plot(irf.r_e_theta,'black')
hold on;
plot(zeros(length(0:40)),'red');
hold off;
title('r')
subplot(3,3,7);
plot(irf.w_e_theta,'black')
hold on;
plot(zeros(length(0:40)),'red');
hold off;
title('w')
grid on;
print('Q2.2','-dpdf')
saveas(gcf,'Q2_2.pdf');




 
