%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Name:  Shreya Kate 
% ID:  2334973997 
% email:  shreyak@usc.edu 
% Submission Date: February 16, 2020 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function v = getvertex(vertex)
    if strcmpi(vertex, 'black')
        v = [0 0 0];
    end
    if strcmpi(vertex,'blue')
        v = [0 0 255];
    end
    if strcmpi(vertex,'green')
        v = [0 255 0];
    end
    if strcmpi(vertex, 'red')
        v = [255 0 0];
    end
    if strcmpi(vertex, 'cyan')
        v = [0 255 255];
    end
    if strcmpi(vertex, 'magenta')
        v = [255 0 255];
    end
    if strcmpi(vertex, 'yellow')
        v = [255 255 0];
    end
    if strcmpi(vertex, 'white')
        v = [255 255 255];
    end
end