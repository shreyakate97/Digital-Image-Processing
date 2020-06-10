%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Name:  Shreya Kate 
% ID:  2334973997 
% email:  shreyak@usc.edu 
% Submission Date: February 16, 2020 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
G = readraw('Rose.raw');
rc = zeros(1,307200); gc = zeros(1,307200); bc = zeros(1,307200);

for i = 0: 307199
    rc(i+1) = G(3*i + 1);
    gc(i+1) = G(3*i + 2);
    bc(i+1) = G(3*i + 3);
end
FR = []; 
for i = 0:479
    out = rc(1+(i*640):640+(i*640));
    FR = [ FR; out];
end
FG = []; 
for i = 0:479
    out = gc(1+(i*640):640+(i*640));
    FG = [ FG; out];
end
FB = [];
for i = 0:479
    out = bc(1+(i*640):640+(i*640));
    FB = [ FB; out];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h1 = (1/16)*[0 0 0; 0 0 7; 3 5 1]; 
T = 128;
fr = FR; fg = FG; fb = FB;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
for i = 1:480
    if mod(i,2) == 1
        for j = 1:640         
            mbvq = getmbvq(fr(i,j),fg(i,j),fb(i,j));
            vertex = getNearestVertex(mbvq, FR(i,j),FG(i,j),FB(i,j));
            v = getvertex(vertex);
            br(i,j) = v(1);
            bg(i,j) = v(2);
            bb(i,j) = v(3);
            qer = FR(i,j) -br(i,j);
            qeg = FG(i,j) -bg(i,j);
            qeb = FB(i,j) -bb(i,j);
            for k = -1:1
                for l = -1:1
                    if i+k > 0 && j+l > 0 && i+k < 481 && j+l < 641
                        FR(i+k,j+l) = FR(i+k,j+l) + h1(k+2,l+2)*qer;
                        FG(i+k,j+l) = FG(i+k,j+l) + h1(k+2,l+2)*qeg;
                        FB(i+k,j+l) = FB(i+k,j+l) + h1(k+2,l+2)*qeb;
                    end
                end
            end
        end
    else
        for j = 640:-1:1
            
            mbvq = getmbvq(fr(i,j),fg(i,j),fg(i,j));
            vertex = getNearestVertex(mbvq, FR(i,j),FG(i,j),FB(i,j));
            v = getvertex(vertex);
            br(i,j) = v(1);
            bg(i,j) = v(2);
            bb(i,j) = v(3);
            qer = FR(i,j) -br(i,j);
            qeg = FG(i,j) -bg(i,j);
            qeb = FB(i,j) -bb(i,j);
            for k = 1:-1:-1
                for l = 1:-1:-1
                    if i+k > 0 && j+l > 0 && i+k < 481 && j+l < 641
                        FR(i+k,j+l) = FR(i+k,j+l) + h1(k+2,2-l)*qer;
                        FG(i+k,j+l) = FG(i+k,j+l) + h1(k+2,2-l)*qeg;
                        FB(i+k,j+l) = FB(i+k,j+l) + h1(k+2,2-l)*qeb;
                    end
                end
            end
        end
    end
end

out = zeros(480,640*3);
for i = 0:479
    for j = 0:639
        out(i+1, 3*j+1) =  br(i+1,j+1);
        out(i+1, 3*j+2) =  bg(i+1,j+1);
        out(i+1, 3*j+3) =  bb(i+1,j+1);
    end
end

count = writeraw(out,'color_halftoning_mbvq.raw');