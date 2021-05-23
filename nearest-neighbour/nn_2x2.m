function out = nn_2x2(f, STEP = 0.1)
    % =========================================================================
    % This function applies nearest-neighbour interpolation on  an image (2x2)
    % f has known values in (1, 1), (1, 2), (2, 1) si (2, 2).
    % 
    % The parameters:
    % - f = the image
    % - STEP = the distance between 2 points
    % =========================================================================
    
    % The coordinates
    x_int = 1 : STEP : 2;
    y_int = 1 : STEP : 2;

    % The number of points
    n = length(x_int);

    % The 4 points will be the same for any case
    x1 = y1 = 1;
    x2 = y2 = 2;

    % Initializing with an empty matrix
    out = zeros(n);
    
    % For every pixel
    for i = 1 : n
        for j = 1 : n
            % The nearest neighbour
            x = x_int(i);
            y = y_int(j);
            if ( x - x1 < x2 - x)
              x_fin = x1;
            else
              x_fin = x2;
            endif
            if (y - y1 < y2 - y)
              y_fin = y1;
             else
              y_fin = y2;
            endif
            % Calculating the pixel
            out(i,j) = f(x_fin,y_fin);
        endfor
    endfor

endfunction
