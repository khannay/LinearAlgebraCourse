N=500;
A=randn(N)*1/sqrt(N); %Create a random matrix 
eigenvals=eig(A);
scatter(real(eigenvals), imag(eigenvals));