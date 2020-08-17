function f_vector = feature_vector(L,E,S,W,R,out,row,col)

e1 = avg_energy(L*L',out,row,col);
e2 = avg_energy(L*E',out,row,col);
e3 = avg_energy(L*S',out,row,col);
e4 = avg_energy(L*W',out,row,col);
e5 = avg_energy(L*R',out,row,col);

e6 = avg_energy(E*L',out,row,col);
e7 = avg_energy(E*E',out,row,col);
e8 = avg_energy(E*S',out,row,col);
e9 = avg_energy(E*W',out,row,col);
e10 = avg_energy(E*R',out,row,col);

e11 = avg_energy(S*L',out,row,col);
e12 = avg_energy(S*E',out,row,col);
e13 = avg_energy(S*S',out,row,col);
e14 = avg_energy(S*W',out,row,col);
e15 = avg_energy(S*R',out,row,col);

e16 = avg_energy(W*L',out,row,col);
e17 = avg_energy(W*E',out,row,col);
e18 = avg_energy(W*S',out,row,col);
e19 = avg_energy(W*W',out,row,col);
e20 = avg_energy(W*R',out,row,col);

e21 = avg_energy(R*L',out,row,col);
e22 = avg_energy(R*E',out,row,col);
e23 = avg_energy(R*S',out,row,col);
e24 = avg_energy(R*W',out,row,col);
e25 = avg_energy(R*R',out,row,col);
%25D
% to calculate discriminant powers, use this
f_vector1 = [e1 e2 e3 e4 e5 e6 e7 e8 e9 e10 e11 e12 e13 e14 e15 e16 e17 e18 e19 e20 e21 e22 e23 e24 e25];
%15D
% dimension reduced (25D to 15D) use this for further questions
f_vector = [e1, (e2+e6)/2 ,(e3+e11)/2, (e4+e16)/2, (e5+e21)/2, e7,(e8+e12)/2, (e9+e17)/2, (e10+e22)/2, e13, (e14+e18)/2, (e15+e23)/2,e19, (e20+e24)/2, e25];
    
end

