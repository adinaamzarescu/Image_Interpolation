function R = bicubic_resize(I, p, q)
    % =========================================================================
    % This function upscales de image using the bicubic interpolation algorithm
    % It resizes the image I from m x n to p x q
    % =========================================================================
    
    % Size of the image
    [m n nr_colors] = size(I);

    % Initializing the final matrix with 0
    R = zeros(p, q);
    
    % Casting I to double
    I = double(I);
    
    % If the image is black and white, it is ignored
    if nr_colors > 1
        R = -1;
        return
    endif


    % The scaling factors
    s_x = (q - 1) / (n - 1);
    s_y = (p - 1) / (m - 1);

    % The matrix that is used in the resizing process
    T = [s_x 0; 0 s_y];

    % The inverse of the T matrix
    T1 = [1/s_x 0 ;0 1/s_y];

    % Precalculating the derivatives
    [Ix Iy Ixy] = precalc_d(I);

    % For every pixel
    for y = 0 : p - 1
        for x = 0 : q - 1
            % Finding x_p and y_p
            Mat = [x y] * T1;
            x_p = Mat(1);
            y_p = Mat(2);

            % To be able to apply the interpolation
            x_p = x_p + 1;
            y_p = y_p + 1;

            % Finding the surrounding points
            [x1 y1 x2 y2] = surrounding_points(n, m, x_p, y_p);

            % Finding the coefficients
            coef = bicubic_coef(I, Ix, Iy, Ixy, x1, y1, x2, y2);

            % Moving (x_p, y_p) to the unit square by subtracting (x1, y1)
            x_p = x_p - x1;
            y_p = y_p - y1;

            % The (x, y) pixel after interpolation
            Mat_X = [1 x_p x_p^2 x_p^3];
            Mat_Y = [1; y_p; y_p^2; y_p^3];
            R(y + 1, x + 1) = Mat_X * coef * Mat_Y;
            
        endfor
    endfor

    % For a valid image
    R = uint8(R);
endfunction


