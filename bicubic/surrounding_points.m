function [x1 y1 x2 y2] = surrounding_points(n, m, x, y)
    % =========================================================================
    % This function finds the 4 points around (x, y)
    % =========================================================================
    
    x1 = floor(x);
    x2 = x1 + 1;
    y1 = floor(y);
    y2 = y1 + 1;
    
    % If y is on the last row
    if ( y1 == m )
      y2 = m;
      y1 = m - 1;
    endif
    
    % If x is on the last column
    if ( x1 == n )
      x2 = n;
      x1 = x2 - 1;
    endif

endfunction