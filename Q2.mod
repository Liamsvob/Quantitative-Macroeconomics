//Pavé Guillaume 	Student number : 16409823
//Svoboda Liam	Student number : 16834509

// Preamble
// **********************************************

// Declare variables and parameters

var A k h c r y klr theta w; 
varexo e_A e_theta;
parameters beta sigma chi alpha delta rho_A sigma_A rho_theta sigma_theta;


// Parametrisation & Calibration

beta = 0.99;
sigma = 2;
chi = 1;
alpha = 0.33;
delta = 0.05;
rho_A = 0.8;
sigma_A = 0.01;
rho_theta = 0.9;
sigma_theta = 0.005;

//Model
// **************************************************
model;

A*k(-1)^alpha*h^(1-alpha) = c+k-k(-1)+delta*k(-1); // Resource constraint 

log(A) = rho_A*log(A(-1))+e_A; // Law of motion of TFP 

log(theta) = rho_theta*log(theta(-1))+(-e_theta); // Law of motion of Labor + e_theta is negative to ralize the negative shock on theta

beta*(((c(+1)-(theta(+1)/(1+chi)*h(+1)^(1+chi)))/(c-(theta/(1+chi)*h^(1+chi))))^(-sigma))*(alpha*A(+1)*k^(alpha-1)*h(+1)^(1-alpha)+1-delta) = 1; //Euler equation 

theta*h^chi = (1-alpha)*A*k(-1)^alpha*h^(-alpha); // 2e Euler

y = A*k(-1)^alpha*h^(1-alpha); // Output 

klr = k(-1)/h; //Capital-to-labour ratio 

r = delta+(1/beta)*(((c(+1)-(theta(+1)/(1+chi)*h(+1)^(1+chi)))/(c-(theta/(1+chi)*h^(1+chi))))^(sigma)); //interest rate 

w = (1-alpha)*A*k(-1)^alpha*h^(-alpha); // Wage

end;

// Steady State
//***********************************************************

initval;

A = 1;

theta = 1;

klr = ((1-(1-delta)*beta)/(alpha*beta))^(1/(alpha-1));

h = ((1-alpha)*klr^alpha)^(1/chi);

k = h*klr;

c = (klr^alpha)*h-(delta*k);

r = 1+(alpha*klr^(alpha-1));

w = (1-alpha)*klr^alpha;

y = klr^alpha*h;

end;

steady;
resid;

// Specification of Shocks
//***********************************************************

shocks;

var e_A = sigma_A^2;//Q2.1
var e_theta = sigma_theta^2;//Q2.2 

end;


// Computation
//***********************************************************

/* Stochastic Simulation
Order: Order is set to 1 to denote the linear order of our taylor series approximation
irf: Impulse Response Functions 40 periods ahead
*/

stoch_simul(irf=40, order=1, irf_shocks=(e_A),graph_format = pdf) A c y k h r w;

stoch_simul(irf=40, order=1, irf_shocks=(e_theta), graph_format = pdf) theta c y k h r w;