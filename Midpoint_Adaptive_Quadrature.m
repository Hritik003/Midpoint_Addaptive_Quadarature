
function out = Midpoint_Adaptive_Quadrature(f,a,b,eps)

      % midpoint
      c = (a+b)/2;
      %obtain the firstintegral approximation for n = 1 node
      syms x;
      Q1 = integral(f,a,b);
       %obtain the firstintegral approximation for n = 2 node
      Q2 = Mc(f,a,b);
      error = (Q2-Q1);
      
      if abs(error) < eps
         disp('     a        b  ');
         X = [a , b];         
         disp(X); 
         disp('     error is: ');
         Y = [abs(error)];
         disp(Y); 
         out = Q2;
      else 
%          disp('     a        b  ');
%          X = [a , b];         
%          disp(X); 
%          disp('     error is: ');
%          Y = [abs(error)];
%          disp(Y);         
         out = vpa((ma(f,a,c, eps/2.0) +  ma(f,c,b,eps/2.0)),12);           
          
      end      
end      






