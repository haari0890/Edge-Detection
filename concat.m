%Code by Hariharan Kumar
function outputimg = concat(app3,h3,v3,d3,b2,c2,d2,b1,c1,d1,b,c,d)


imga = cat(2,mat2gray(app3),mat2gray(h3));
imgb = cat(2,mat2gray(v3),mat2gray(d3));
imgc = cat(1,mat2gray(imga),mat2gray(imgb));
imgA = cat(2,mat2gray(imgc),mat2gray(b2));
imgB = cat(2,mat2gray(c2),mat2gray(d2));
imgC = cat(1,mat2gray(imgA),mat2gray(imgB));
imgD = cat(2,mat2gray(imgC),mat2gray(b1));
imgE = cat(2,mat2gray(c1),mat2gray(d1));
imgF = cat(1,mat2gray(imgD),mat2gray(imgE));
imgG = cat(2,mat2gray(imgF),mat2gray(b));
imgH = cat(2,mat2gray(c),mat2gray(d));
outputimg=cat(1,mat2gray(imgG),mat2gray(imgH));
