function out = bilinear_rotate_RGB(img, rotation_angle)
    % =========================================================================
     % This function rotates the image I using bilinear interpolation.
     % The image is coloured
    % =========================================================================
    
    % Red
    red = img(:,:,1);
    % Green
    green = img(:,:,2);
    % Blue
    blue = img(:,:,3);
    
    % Applying the function
    red = bilinear_rotate(red, rotation_angle);
    green = bilinear_rotate(green, rotation_angle);
    blue = bilinear_rotate(blue, rotation_angle);
    
    % The final image
    out = cat(3, red, green, blue);
    
endfunction