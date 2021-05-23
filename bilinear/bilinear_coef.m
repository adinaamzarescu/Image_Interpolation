function a = bilinear_coef(f, x1, y1, x2, y2)
    % =========================================================================
    % This function calculates the coefficients of 4 points
    % for the bilinear interpolation
    % =========================================================================

    % A matrix
    A = [1 x1 y1 x1*y1;1 x1 y2 x1*y2; 1 x2 y1 x2*y1; 1 x2 y2 x2*y2];
    
    % b array    
    b = [f(y1, x1); f(y2,x1); f(y1, x2); f(y2, x2)];
    
    % The coefficients
    A = double(A);
    b = double(b);
    a = A \ b;
endfunction
