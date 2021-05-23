function r = fxy(f, x, y)
    % =========================================================================
    % This function aproximates the x and y derivative of f in (x, y).
    % =========================================================================
    r = (f(x - 1, y - 1) + f(x + 1, y + 1) -
         f(x - 1, y + 1) - f(x + 1, y - 1)) / 4;
endfunction