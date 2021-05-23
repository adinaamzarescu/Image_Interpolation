function out = bilinear_2x2_RGB(img, STEP = 0.1)
    % =========================================================================
    % This function applies bilinear interpolation on  an image (2x2)
    % The image is coloured
    % f has known values in (1, 1), (1, 2), (2, 1) si (2, 2).
    % 
    % The parameters:
    % - img = the image
    % - STEP = the distance between 2 points
    % =========================================================================

    % Red
    red = img(:,:,1);
    % Green
    green = img(:,:,2);
    % Blue
    blue = img(:,:,3);

    % Applying the function
    red = bilinear_2x2(red, STEP);
    green = bilinear_2x2(green, STEP);
    blue = bilinear_2x2(blue, STEP);
    
    % The final image
    out = cat(3, red, green, blue);
endfunction
