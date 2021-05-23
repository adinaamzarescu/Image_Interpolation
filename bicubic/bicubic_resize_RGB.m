function out = bicubic_resize_RGB(img, p, q)
    % =========================================================================
    % This function resizes the image img to p x q
    % This image is coloured
    % =========================================================================

    % Red
    red = img(:,:,1);
    % Green
    green = img(:,:,2);
    % Blue
    blue = img(:,:,3);

    % Applying the function
    red = bicubic_resize(red, p, q);
    green = bicubic_resize(green, p, q);
    blue = bicubic_resize(blue, p ,q);

    % The final image
    out = cat(3, red, green, blue);
endfunction
