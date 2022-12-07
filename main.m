f =@(x) (x./ (sqrt(x.^2 +9)));
adaptive_midpoint = ma(f,0,4,0.5*10^(-8));
display (adaptive_midpoint);