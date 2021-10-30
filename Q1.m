%Pavé Guillaume 	Student number : 16409823
%Svoboda Liam	Student number : 16834509

clear;
close all;
clc;

% This problem can be seen like a Markov Chain

%% Question 1
%% Calibration

T = 500000; %

%% Initialise variables

u = zeros(T,1);
transition_probabilities = [0.9 0.1; 0.8 0.2];% Transition probablities matrix.
states = zeros(T,1); %we create the matrix for the different states of economy.
initialState = 0; %we initalize the first state of economy by 0 that is a recession economy.

e = zeros(T,1); %we create the matrix for beliefs.
initialBelief = 0;
delta = 0.5;

%% Set initial values

for i=1:T
    u(i,1)= rand; % generate a vector u Tx1 drawn from uniform distribution
end

%% Question 2
mean_u = mean(u); % mean of vector u

%% Question 3

states(1)= initialState; %We initialize the first of economy.

% We run a markov chain Algortihm that is a recursive algorithm.
for i=2:T
        this_step_distribution = transition_probabilities(states(i-1)+1,:);% We can the probabilty of changing state.
        cumulative_distribution = cumsum(this_step_distribution); %We compute the cumulative distribution.
        if cumulative_distribution>u(i)
           states(i) = 0;
        else
           states(i) = 1; 
        end
end


mean_s = mean(states); %mean of states e

%% Question 5
e(1) = initialBelief;

for i=2:T
    e(i) = delta*states(i)+(1-delta)*e(i-1);
end

mean_e = mean(e); %mean of belief e

%% Plot
figure
plot(states,'blue')
hold on;
plot(e,'red')
hold on;
plot(ones(length(0:80))*mean_e,'black')
hold off;
xlim([0 80]); 
ylim([0 1]);
xlabel('Periods', 'FontSize', 12)
title('Evolution of current state of economy', 'FontSize',20)
legend('States s_t', 'Belief e_t', 'mean of Belief e')
grid on;
print('Q1.1','-dpdf')
saveas(gcf,'Q1_1.pdf');