# Image Interpolation
                    
*Copyright 2021 Amzarescu Adina-Maria* 
____________________________________________________________________________________

__Nearest neighbour__

   This method requires the least processing time because it only
considers one pixel: the closest one to the interpolated point
It has the effect of simply making each pixel bigger.

   The interpolation is based on finding the coordinates and adding
the values to a matrix.
   The function duplicates the rows and columns to get the interpolated
image.
   For the resize function I used 2 scaling factors (s_x and s_y). To
be able to apply the interpolation I had to add 1 to x_p and y_p (the
coordinates) of the initial matrix.
   In order for the matrix to be a valid image I used the uint8() function.
	
For the colour images I applied the function 3 times for every colour 
- red
- green
- blue
____________________________________________________________________________________

__Bilinear__

   This method considers the closest 2x2 neighborhood of known pixel values
surrounding the unknown pixels.
   It takes a wheighted average of these 4 pixels to arrive at the final
interpolated values and it results in smoother looking images than nearest
neighborhood.
	
   For this method I used a function ( bilinear_coef() ) to calculate
a matrix A and an array b to find the necessary coefficients for the f
function. This function was used to find the value of each pixel.

__->f (x, y) = a 0 + a 1 x + a 2 y + a 3 xy__

   For the resize function I used 2 scaling factors (s_x and s_y) and 2
matrices. T1 is the inverse of the T matrix wich was used in the resizing process.
The coordinates were the first 2 values of the Mat matrix (__Mat = T1 * [x ; y]__).
To be able to apply the interpolation I had to add 1 to x_p and y_p (the
coordinates) of the initial matrix. For the bilinear method I also used a function
to find the surrounding points of the coordinates.
   For the rotate function I found the trigonometric identities of the
rotation angle (cos and sin). I used the matrix T (T = [cos -sin; sin cos])
to find the x_p and y_p coordinates. If they were outside the image, the pixel
was black. After finding the surrounding points and the coefficients I applied
the formula for the bilinear interpolation.
   In order for the matrix to be a valid image I used the uint8() function.

For the colour images I applied the function 3 times for every colour 
- red
- green
- blue
____________________________________________________________________________________

__Bicubic__

   This method is one step beyond bilinear by considering the closest 4x4
neighborhood of known pixels, for a total of 16 pixels.
   Since these are at various distances from the unknown pixel, closer
pixels are given a higher weighting in the calculation.
   It produces sharper images than the previous two methods. This is a
good compromise between processing time and output quality.

   For this method I firstly found the derivatives of x, y and xy. I used
them in order to find the 3 intermediate matrices. Those 3 matrices were then used
to create a bigger matrix (I3).

I3:

| f(0,0)  f(0,1)  Iy(0,0)  Iy(0,1)  |  
| f(1,0)  f(1,1)  Iy(1,0)  Iy(1,1)  |  
| Ix(0,0) Ix(0,1) Ixy(0,0) Ixy(0,1) |  
| Ix(1,0) Ix(1,1) Ixy(1,0) Ixy(1,1) |  

This matrix was used with the other 2 (I1, I2) matrices in order to find the
A matrix that was needed in the final formula.

   In order to move the (x_p, y_p) to the unit square I subtracted (x1, y1).
Then I applyed the final formula in order to find the pixel.

__-> f(x,y) = [1 x x^2 x^3] * A * [1; y; y^2; y^3]__

   In order for the matrix to be a valid image I used the uint8() function.
	
For the colour images I applied the function 3 times for every colour 
- red
- green
- blue

____________________________________________________________________________________
