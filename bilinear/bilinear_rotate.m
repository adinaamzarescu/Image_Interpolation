function R = bilinear_rotate(I, rotation_angle)
    % =========================================================================
    % This function rotates the image I using bilinear interpolation
    % rotation_angle is in radians
    % =========================================================================
    
    [m n nr_colors] = size(I);
    
    I = double(I);
    % If the image is black and white, it is ignored
    if nr_colors > 1
        R = -1;
        return
    endif

    % Cos and sin for the rotation angle
    c = cos(rotation_angle);
    s = sin(rotation_angle);
    
    % Initialization of the final matrix
    R = zeros(m, n);
    
    % The matrix for the transformation
    T = [c -s; s c];
    
    % The invert of the matrix
    Ti = T';
    
    % For every pixel
    for y = 0 : m - 1
        for x = 0 : n - 1
            % Calculation of x_p and y_p
            M = Ti * [x; y];
            x_p = M(1);
            y_p = M(2);
            
            % To be able to apply the interpolation
            x_p = x_p + 1;
            y_p =  y_p + 1;
            
            % If x_p or y_p are outside of the image, the pixel is black
            if(x_p > n || x_p < 1 || y_p > m || y_p < 1)
              R(y + 1, x + 1) = 0;
              continue;
            endif
            
            % Finding the surrounding points
            [x1 y1 x2 y2] = surrounding_points(n, m, x_p, y_p);
            
            % Calculating the coefficients
            a = bilinear_coef(I, x1, y1, x2, y2);
            
            % The (x_p, y_p) pixel after interpolation
            R(y + 1, x + 1) = a(1) + a(2) * x_p + a(3) * y_p + a(4) * x_p * y_p;
        endfor
    endfor

    % The image has to be valid
    R = uint8(R);
endfunction