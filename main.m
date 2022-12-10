

% defining the function
f =@(x) (x./ (sqrt(x.^2 +9)));


% calling the function with the tolerance value 0.5x10^(-8)
Approx_integral = ma(f,0,4,0.5*10^(-6));

% printing the value obtained by the midpoint quadrature.
display (Approx_integral);

% graph of the actual curve f(x) in the interval [0,4]
hold on
fplot(f,[0,4],'LineWidth',3.0 );
hold off



% function code for the midpoint-composite formula.
function out = Midpoint_composite(f,a,b)
     h = (b-a);
     p =(a+b)/2;    
     out = h*feval(f,p);
end    


% function code for the midpoint_quadrature formula.
function out = ma(f,a,b,eps)

      % midpoint of the interval [a,b]
      c = (a+b)/2;

      %obtain the actual value of integral(f) in [a,b]
      syms x;
      Q1 = integral(f,a,b);

      %obtain the integral approximation using the midpoint-composite rule.
      Q2 = Mc(f,a,b);

     
      % obtain the error |I(approx)-I(actual)|       
      error = (Q2-Q1);

      % checking if error is greater/lesser than tolerance given   

      if abs(error) < eps
         
        %if lesser, we dont further break that interval.
         disp('     a        b  ');
         X = [a , b];         
         disp(X); 
         disp('     error is: ');
         Y = [abs(error)];
         disp(Y);      
         out = Q2;

         %plotting each rectangular bar.
         i = c/10;
     
         rectangle('Position',[a 0 b-a feval(f,c)],'Curvature',0, 'FaceColor', [i i+0.09 i+0.06], ...
         'LineWidth',0.5);


      else   
         %if greater, then we further break the interval i.e, with 
         % tol = tol/2
         out = vpa((ma(f,a,c, eps/2.0) +  ma(f,c,b,eps/2.0)),12);           
          
      end  
end      
