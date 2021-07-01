function out = backIntegral(points,projectionData,M)
    size = length(points)-1; %# of segments is 1 smaller than # of points.
    deneme = zeros(size,3); %Allocate output array.
    
    for i = 2:length(points)
        segmentLen = sqrt((points(i-1,1) - points(i,1))^2 + ...
        (points(i-1,2) - points(i,2))^2); %dx length is calculated
        
        segmentX = (points(i-1,1) + points(i,1))/2; 
        segmentY = (points(i-1,2) + points(i,2))/2; 
        %mid points of the segments are used to determine the actual
        %position in the distribution array
        
        segmentX = ceil(segmentX + M); %cartesian coordinates converted to
        segmentY = ceil(M-segmentY);   %array indices of input
        
        deneme(i-1,1) = segmentY; %Output array contains both array
        deneme(i-1,2) = segmentX; %locations and data.
        deneme(i-1,3) = segmentLen*projectionData;
    end
    out = deneme;
end