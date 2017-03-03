num = 6; 
RT = 200; 
BT = 150; 
B = sym('b',[1 num]); 
%A = scalefree(num,2,1); 
A = [0 0 1 0 0 0;0 0 1 0 0 0;1 1 0 1 0 0;0 0 1 0 1 1;0 0 0 1 0 1;0 0 0 1 1 0]; 
%num = length(A); 
initial = [4 4 4 4 4 4;0 0 0 0 0 0];
f = 0;

for i = 1:num 
red = 0; 
black = 0; 
    for j = 1:num 
        if A(i,j) == 1
            red = red + initial(2,j)/BT; 
            black = black + B(j); 
        end 
        if i == j 
            red = red + initial(2,j)/BT; 
            black = black + B(j); 
        end 
    end
    
    f = f + red/(red + black);
end 

g = gradient(f,B);   

iterations = 100; 

for r = 1:num 
    a(r) = initial(1,r)/BT;  
end 



for t = 1:iterations
    h = subs(g,B,a); 
    h = double(h);
    for s = 1:num
        y(s) = a(s) - h(s)/t;
    end 
    a = SimplexProj(y); 
end 

sum = 0 ; 

for r = 1:num 
    a(r) = a(r)*BT;  
    sum = sum + a(r); 
end 

a = round(a); 

