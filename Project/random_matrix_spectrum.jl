using Plots, LinearAlgebra

function plot_spectrum_rm(n)
	 M=1.0/sqrt(n)*randn(n,n);
	 evals=eigvals(M)
	 p=scatter(real.(evals), imag.(evals), label="")
    	 xlims!(-1.2,1.2)
    	 ylims!(-1.2,1.2)
    	 xlabel!("Real(lambda)")
    	 ylabel!("Imag(lambda)")
    	 title!("Eigenvalue Spectrum for Random Matrix of size $(n)")
	 display(p)
end

plot_spectrum_rm(1000)
	 