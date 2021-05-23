
function R = bilinear_resize(I, p, q)
    % =========================================================================
    % This function upscales de image using the bilinear interpolation
    % algorithm. It resizes the image I from m x n to p x q
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
    T = [s_x 0 ;0 s_y];
    
    % The inverse of the T matrix
    T1 = [1/s_x 0 ;0 1/s_y];
    
    % For every pixel
    for y = 0 : p - 1
        for x = 0 : q - 1
            % Finding x_p and y_p
            Mat = T1 * [x ; y];
            x_p = Mat(1);
            y_p = Mat(2);
            
            % To be able to apply the interpolation
            x_p = x_p + 1;
            y_p = y_p + 1;
            
            % Finding the surrounding points
            [x1 y1 x2 y2] = surrounding_points(n, m, x_p, y_p);
            
            % Finding the coefficients
            a = bilinear_coef(I, x1, y1, x2, y2);
            
            % The (x, y) pixel after interpolation
            R(y + 1, x + 1) = a(1) + a(2) * x_p + a(3) * y_p + a(4) * x_p * y_p;
       
        endfor
    endfor

    % For a valid image
    R = uint8(R);
endfunction
