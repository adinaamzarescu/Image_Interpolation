function out = nn_2x2_RGB(img, STEP = 0.1)
    % =========================================================================
    % This function applies nearest-neighbour interpolation on  an image (2x2)
    % The image is coloured
    % =========================================================================

    % Red
    red = img(:,:,1);
    % Green
    green = img(:,:,2);
    % Blue
    blue = img(:,:,3);
    
    % Applying the function
    red = nn_2x2(red, STEP);
    green = nn_2x2(green, STEP);
    blue = nn_2x2(blue, STEP);
    
    % The final image
    out = cat(3, red, green, blue);

endfunction
