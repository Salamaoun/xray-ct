function out = findInt(theta,t,M) %find integer crossing points of a particular line
    NewArray = zeros(4*M+2,2); %max possible size is allocated    
    i=1;
    if(sin(theta) ~= 0) %for regular angles
        for x=-M:M %for all integer x
            y = (t-x*cos(theta))/sin(theta); %find y values
            if(y<=M && y>=-M)
                NewArray(i,1) = x; %save points lying inside the image
                NewArray(i,2) = y;
                i = i+1;
            end
        end
    else
        for y=-M:M %special case for theta = 0,180
            NewArray(y+M+1,2) = y; %line passes through all y
            NewArray(y+M+1,1) = t; %with x constant
        end
    end
    
    if(cos(theta)~=0) %for regular angles
        for y=-M:M %for every integer y
            x = (t-y*sin(theta))/cos(theta); %find x values
            if(x<=M && x>=-M)
                NewArray(i,1) = x; %save points corresponding to image
                NewArray(i,2) = y;
                i = i+1;
            end
        end
    else
        for x=-M:M %special case for theta=90
            NewArray(x+M+1,1) = x; %line passes through all x
            NewArray(x+M+1,2) = t; %with y constant
        end
    end
    
    NewArray = uniquetol(NewArray,'ByRows',true); %delete identical points
    NewArray = NewArray(any(NewArray,2),:); %delete empty rows
    out = sortrows(NewArray); %sort array for increasing x
end