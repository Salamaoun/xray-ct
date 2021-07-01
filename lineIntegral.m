function out = lineIntegral(input,points,M) %calculates line integral of input
                                            %with integer crossing points
                                            %provided sequentially
                                            
    sum = 0;
    for i = 2:length(points)
        segmentLen = sqrt((points(i-1,1) - points(i,1))^2 + ...
        (points(i-1,2) - points(i,2))^2); %dx length is calculated
        
        segmentX = (points(i-1,1) + points(i,1))/2; 
        segmentY = (points(i-1,2) + points(i,2))/2; 
        %mid points of the segments are used to determine the actual
        %position in the distribution array
        
        segmentX = ceil(segmentX + M); %cartesian coordinates converted to
        segmentY = ceil(M-segmentY);   %array indices of input
        
        sum = sum + input(segmentY, segmentX)*segmentLen; %mu*dx added up
    end
    out = sum;
end