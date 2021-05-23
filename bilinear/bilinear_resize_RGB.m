function out = bilinear_resize_RGB(img, p, q)
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
    red = bilinear_resize(red, p, q);
    green = bilinear_resize(green, p, q);
    blue = bilinear_resize(blue, p, q);
    
    % The final image
    out = cat(3, red, green, blue);

endfunction