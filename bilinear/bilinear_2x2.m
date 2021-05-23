function out = bilinear_2x2(f, STEP = 0.1)
    % =========================================================================
    % This function applies bilinear interpolation on  an image (2x2)
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

    % Calculating the coefficients
    a = bilinear_coef(f, x1, y1, x2, y2);
    
    % Initializing with an empty matrix
    out = zeros(n);
    
    % For every pixel
    for i = 1 : n
        for j = 1 : n
            x = x_int(j);
            y = y_int(i);
            % The value of the pixel
            out(i, j) = a(1) + a(2)*x + a(3)*y + a(4)*x*y;
        endfor
    endfor

    % To be a valid image
    out = uint8(out);
endfunction
