
function R = nn_resize(I, p, q)
    % =========================================================================
    % This function upscales de image using the nearest-neighbour interpolation
    % algorithm. It resizes the image I from m x n to p x q
    % =========================================================================
    
    % Size of the image
    [m n nr_colors] = size(I);

    % If the image is black and white, it is ignored
    if nr_colors > 1
        R = -1;
        return
    endif
    
    % Casting I to double
    I = double(I);
    
    % Initializing the final matrix with 0
    R = zeros(p, q);

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
            
            % The nearest neighbour
            x1 = floor(x_p);
            y1 = floor(y_p);
            x2 = x1 + 1;
            y2 = y1 + 1;
            
            if ( x_p - x1 < x2 - x_p)
              x_fin = x1;
            else
              x_fin = x2;
            endif
            if (y_p - y1 < y2 - y_p)
              y_fin = y1;
             else
              y_fin = y2;
            endif
            % The (x, y) pixel after interpolation
            R(y + 1, x + 1) = I(y_fin, x_fin);
            
        endfor
    endfor

    % For a valid image
    R = uint8(R);

endfunction
