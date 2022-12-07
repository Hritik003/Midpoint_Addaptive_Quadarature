function out = Midpoint_composite(f,a,b)
     h = (b-a);
     p =(a+b)/2;    
     out = h*feval(f,p);
end    


