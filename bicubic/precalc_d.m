function [Ix, Iy, Ixy] = precalc_d(I)
    % =========================================================================
    % This function precalculates the Ix Iy and Ixy matrices which contain
    % the dx dy and dxy derivatives of the image I (for each pixel)
    % =========================================================================
    
    % Size of the image
    [m n nr_colors] = size(I);
    
    % The matrix needs to be a double
    I = double(I);
    
    % Ix matrix:
    % Because the first and last columns need to be empty (0)
    Ix = zeros(m,n);
    
    for i = 1 : m
      for j = 2 : n - 1
        Ix(i, j) = fx(I, i, j);
      endfor
    endfor
    
    % Iy matrix:
    % Because the first and last rows need to be empty (0)
    Iy = zeros(m,n);
    
    for i = 2 : m - 1
      for j = 1 : n
        Iy(i, j) = fy(I, i, j);
      endfor
    endfor
      
    % Ixy matrix:
    % Because the border of the matrix needs to be full of 0
    Ixy = zeros(m,n);
    
    for i = 2 : m - 1
      for j = 2 : n - 1
        Ixy(i, j) = fxy(I, i, j);
      endfor
    endfor
    
endfunction
