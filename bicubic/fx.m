function r = fx(f, x, y)
    % =========================================================================
    % This function aproximates the x derivative of f in (x, y).
    % =========================================================================
    r = (f(x, y + 1) - f(x, y - 1)) / 2;
endfunction