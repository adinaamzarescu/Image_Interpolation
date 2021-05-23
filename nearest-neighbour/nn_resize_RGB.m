function out = nn_resize_RGB(img, p, q)
    % =========================================================================
    % This function upscales de image using the nearest-neighbour interpolation
    % algorithm. It resizes the image I from m x n to p x q
    % The image is coloured
    % =========================================================================

    % Red
    red = img(:,:,1);
    % Green
    green = img(:,:,2);
    % Blue
    blue = img(:,:,3);
    
    % Applying the function
    red = nn_resize(red, p, q);
    green = nn_resize(green, p, q);
    blue = nn_resize(blue, p, q);
    
    % The final image
    out = cat(3, red, green, blue);


endfunction
