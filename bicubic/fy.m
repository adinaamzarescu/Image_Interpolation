function r = fy(f, x, y)
    % =========================================================================
    % This function aproximates the y derivative of f in (x, y).
    % =========================================================================
    r = (f(x + 1, y) - f(x - 1, y)) / 2;
endfunction