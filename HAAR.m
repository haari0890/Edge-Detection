%Start of code by Hariharan Kumar:
clear; clc;

img1 = imread('D:\Books\CVIP\Project\Project #1 Image_Carriage.jpg');
img2 = imread('D:\Books\CVIP\Project\Project #1 Image_Lena.jpg');
img3 = imread('D:\Books\CVIP\Project\Project #1 Image_Peppers.jpg');

img1gnoise = imnoise(img1,'gaussian',0.2);
img2gnoise = imnoise(img2,'gaussian',0.2);
img3gnoise = imnoise(img3,'gaussian',0.2);

img1inoise = imnoise(img1, 'salt & pepper', 0.02);
img2inoise = imnoise(img2, 'salt & pepper', 0.02);
img3inoise = imnoise(img3, 'salt & pepper', 0.02);

figure, imshow(img1), title('Original Carriage image');
figure, imshow(img2), title('Original Lena image');
figure, imshow(img3), title('Original Peppers image');

figure, imshow(img1gnoise), title('Gaussian Noise Carriage image');
figure, imshow(img2gnoise), title('Gaussian Noise Lena image');
figure, imshow(img3gnoise), title('Gaussian Noise Peppers image');

figure, imshow(img1inoise), title('Impulse Noise Carriage image');
figure, imshow(img2inoise), title('Impulse Noise Lena image');
figure, imshow(img3inoise), title('Impulse Noise Peppers image');

[a,b,c] = wavefun('haar',2);
[l,h,lr,hr] = orthfilt(a);

[a1,b1,c1] = wavefun('haar',3);
[l1,h1,lr1,hr1] = orthfilt(a1);

[app,H,V,D,app1,H1,V1,D1,app2,H2,V2,D2,app3,H3,V3,D3] = wavelettrans(img1,l,h);
[appn,Hn,Vn,Dn,appn1,Hn1,Vn1,Dn1,appn2,Hn2,Vn2,Dn2,appn3,Hn3,Vn3,Dn3] = wavelettrans(img1gnoise,l,h);
[appni,Hni,Vni,Dni,appni1,Hni1,Vni1,Dni1,appni2,Hni2,Vni2,Dni2,appni3,Hni3,Vni3,Dni3] = wavelettrans(img1inoise,l,h);

op = concat(app3,H3,V3,D3,H2,V2,D2,H1,V1,D1,H,V,D);
opn = concat(appn3,Hn3,Vn3,Dn3,Hn2,Vn2,Dn2,Hn1,Vn1,Dn1,Hn,Vn,Dn);
opni = concat(appni3,Hni3,Vni3,Dni3,Hni2,Vni2,Dni2,Hni1,Vni1,Dni1,Hni,Vni,Dni);
figure, imshow(op), title('Carriage 4 level wavelet transform using Scale 2 of HAAR');
figure, imshow(opn), title('Carriage with Gaussian noise 4 level wavelet transform using Scale 2 of HAAR');
figure, imshow(opni), title('Carriage with impulse noise 4 level wavelet transform using Scale 2 of HAAR');

[apps,Hs,Vs,Ds,apps1,Hs1,Vs1,Ds1,apps2,Hs2,Vs2,Ds2,apps3,Hs3,Vs3,Ds3] = wavelettrans(img1,l1,h1);
[appsn,Hsn,Vsn,Dsn,appsn1,Hsn1,Vsn1,Dsn1,appsn2,Hsn2,Vsn2,Dsn2,appsn3,Hsn3,Vsn3,Dsn3] = wavelettrans(img1gnoise,l1,h1);
[appsni,Hsni,Vsni,Dsni,appsni1,Hsni1,Vsni1,Dsni1,appsni2,Hsni2,Vsni2,Dsni2,appsni3,Hsni3,Vsni3,Dsni3] = wavelettrans(img1inoise,l1,h1);
ops = concat(apps3,Hs3,Vs3,Ds3,Hs2,Vs2,Ds2,Hs1,Vs1,Ds1,Hs,Vs,Ds);
opsn = concat(appsn3,Hsn3,Vsn3,Dsn3,Hsn2,Vsn2,Dsn2,Hsn1,Vsn1,Dsn1,Hsn,Vsn,Dsn);
opsni = concat(appsni3,Hsni3,Vsni3,Dsni3,Hsni2,Vsni2,Dsni2,Hsni1,Vsni1,Dsni1,Hsni,Vsni,Dsni);

figure, imshow(ops), title('Carriage 4 level wavelet transform with Scale 3 of HAAR');
figure, imshow(opsn), title('Carriage with Gaussian noise 4 level wavelet transform with Scale 3 of HAAR');
figure, imshow(opsni), title('Carriage with impulse noise 4 level wavelet transform with Scale 3 of HAAR');

%Scale Multiplication

HH = H.*Hs;
VV = V.*Vs;
Edge = sqrt(HH+VV);

HHn = Hn.*Hsn;
VVn = Vn.*Vsn;
Edgen = sqrt(HHn+VVn);

HHni = Hni.*Hsni;
VVni = Vni.*Vsni;
Edgeni = sqrt(HHni+VVni);


figure, imshow(Edge), title('Edge before thresholding');
figure, imshow(Edgen), title('Edge before thresholding');
figure, imshow(Edgeni), title('Edge before thresholding');

output = thres(HH,VV, Edge, H, Hs, V, Vs);
figure,imshow(output), title('Edge map of Carriage');

outputn = thres(HHn,VVn, Edgen, Hn, Hsn, Vn, Vsn);
figure, imshow(outputn), title('Edge map of Carriage with Gaussian noise');

outputni = thres(HHni,VVni, Edgeni, Hni, Hsni, Vni, Vsni);
figure, imshow(outputni), title('Edge map of Carriage with impulse noise');

%Lena Image

[app,H,V,D,app1,H1,V1,D1,app2,H2,V2,D2,app3,H3,V3,D3] = wavelettrans(img2,l,h);
[appn,Hn,Vn,Dn,appn1,Hn1,Vn1,Dn1,appn2,Hn2,Vn2,Dn2,appn3,Hn3,Vn3,Dn3] = wavelettrans(img2gnoise,l,h);
[appni,Hni,Vni,Dni,appni1,Hni1,Vni1,Dni1,appni2,Hni2,Vni2,Dni2,appni3,Hni3,Vni3,Dni3] = wavelettrans(img2inoise,l,h);

op = concat(app3,H3,V3,D3,H2,V2,D2,H1,V1,D1,H,V,D);
opn = concat(appn3,Hn3,Vn3,Dn3,Hn2,Vn2,Dn2,Hn1,Vn1,Dn1,Hn,Vn,Dn);
opni = concat(appni3,Hni3,Vni3,Dni3,Hni2,Vni2,Dni2,Hni1,Vni1,Dni1,Hni,Vni,Dni);

figure, imshow(op), title('Lena 4 level wavelet transform using Scale 2 of HAAR');
figure, imshow(opn), title('Lena with noise 4 level wavelet transform using Scale 2 of HAAR');
figure, imshow(opni), title('Lena with impulse noise 4 level wavelet transform using Scale 2 of HAAR');

[apps,Hs,Vs,Ds,apps1,Hs1,Vs1,Ds1,apps2,Hs2,Vs2,Ds2,apps3,Hs3,Vs3,Ds3] = wavelettrans(img2,l1,h1);
[appsn,Hsn,Vsn,Dsn,appsn1,Hsn1,Vsn1,Dsn1,appsn2,Hsn2,Vsn2,Dsn2,appsn3,Hsn3,Vsn3,Dsn3] = wavelettrans(img2gnoise,l1,h1);
[appsni,Hsni,Vsni,Dsni,appsni1,Hsni1,Vsni1,Dsni1,appsni2,Hsni2,Vsni2,Dsni2,appsni3,Hsni3,Vsni3,Dsni3] = wavelettrans(img2inoise,l1,h1);
ops = concat(apps3,Hs3,Vs3,Ds3,Hs2,Vs2,Ds2,Hs1,Vs1,Ds1,Hs,Vs,Ds);
opsn = concat(appsn3,Hsn3,Vsn3,Dsn3,Hsn2,Vsn2,Dsn2,Hsn1,Vsn1,Dsn1,Hsn,Vsn,Dsn);
opsni = concat(appsni3,Hsni3,Vsni3,Dsni3,Hsni2,Vsni2,Dsni2,Hsni1,Vsni1,Dsni1,Hsni,Vsni,Dsni);

figure, imshow(ops), title('Lena 4 level wavelet transform using Scale 3 of HAAR');
figure, imshow(opsn), title('Lena with noise 4 level wavelet transform using Scale 3 of HAAR');
figure, imshow(opsni), title('Lena with impulse noise 4 level wavelet transform using Scale 3 of HAAR');

HH = H.*Hs;
VV = V.*Vs;
Edge = sqrt(HH+VV);

HHn = Hn.*Hsn;
VVn = Vn.*Vsn;
Edgen = sqrt(HHn+VVn);

HHni = Hni.*Hsni;
VVni = Vni.*Vsni;
Edgeni = sqrt(HHni+VVni);


figure, imshow(Edge), title('Edge before thresholding');
figure, imshow(Edgen), title('Edge before thresholding');
figure, imshow(Edgeni), title('Edge before thresholding');

output = thres(HH,VV, Edge, H, Hs, V, Vs);
figure,imshow(output), title('Edge map of Lena');

outputn = thres(HHn,VVn, Edgen, Hn, Hsn, Vn, Vsn);
figure, imshow(outputn), title('Edge map of Lena with Gaussian noise');

outputni = thres(HHni,VVni, Edgeni, Hni, Hsni, Vni, Vsni);
figure, imshow(outputni), title('Edge map of Lena with Impulse noise');

%Peppers Image

[app,H,V,D,app1,H1,V1,D1,app2,H2,V2,D2,app3,H3,V3,D3] = wavelettrans(img3,l,h);
[appn,Hn,Vn,Dn,appn1,Hn1,Vn1,Dn1,appn2,Hn2,Vn2,Dn2,appn3,Hn3,Vn3,Dn3] = wavelettrans(img3gnoise,l,h);
[appni,Hni,Vni,Dni,appni1,Hni1,Vni1,Dni1,appni2,Hni2,Vni2,Dni2,appni3,Hni3,Vni3,Dni3] = wavelettrans(img3inoise,l,h);

op = concat(app3,H3,V3,D3,H2,V2,D2,H1,V1,D1,H,V,D);
opn = concat(appn3,Hn3,Vn3,Dn3,Hn2,Vn2,Dn2,Hn1,Vn1,Dn1,Hn,Vn,Dn);
opni = concat(appni3,Hni3,Vni3,Dni3,Hni2,Vni2,Dni2,Hni1,Vni1,Dni1,Hni,Vni,Dni);
figure, imshow(op), title('Peppers 4 level wavelet transform using Scale 2 of HAAR');
figure, imshow(opn), title('Peppers with noise 4 level wavelet transform using Scale 2 of HAAR');
figure, imshow(opni), title('Peppers with impulse noise 4 level wavelet transform using Scale 2 of HAAR');

[apps,Hs,Vs,Ds,apps1,Hs1,Vs1,Ds1,apps2,Hs2,Vs2,Ds2,apps3,Hs3,Vs3,Ds3] = wavelettrans(img3,l1,h1);
[appsn,Hsn,Vsn,Dsn,appsn1,Hsn1,Vsn1,Dsn1,appsn2,Hsn2,Vsn2,Dsn2,appsn3,Hsn3,Vsn3,Dsn3] = wavelettrans(img3gnoise,l1,h1);
[appsni,Hsni,Vsni,Dsni,appsni1,Hsni1,Vsni1,Dsni1,appsni2,Hsni2,Vsni2,Dsni2,appsni3,Hsni3,Vsni3,Dsni3] = wavelettrans(img3inoise,l1,h1);
ops = concat(apps3,Hs3,Vs3,Ds3,Hs2,Vs2,Ds2,Hs1,Vs1,Ds1,Hs,Vs,Ds);
opsn = concat(appsn3,Hsn3,Vsn3,Dsn3,Hsn2,Vsn2,Dsn2,Hsn1,Vsn1,Dsn1,Hsn,Vsn,Dsn);
opsni = concat(appsni3,Hsni3,Vsni3,Dsni3,Hsni2,Vsni2,Dsni2,Hsni1,Vsni1,Dsni1,Hsni,Vsni,Dsni);

figure, imshow(ops), title('Peppers 4 level wavelet transform using Scale 3 of HAAR');
figure, imshow(opsn), title('Peppers with noise 4 level wavelet transform using Scale 3 of HAAR');
figure, imshow(opsni), title('Peppers with impulse noise 4 level wavelet transform using Scale 3 of HAAR');
HH = H.*Hs;
VV = V.*Vs;
Edge = sqrt(HH+VV);

figure, imshow(Edge), title('Edge before thresholding');

HHn = Hn.*Hsn;
VVn = Vn.*Vsn;
Edgen = sqrt(HHn+VVn);

figure, imshow(Edgen), title('Edge before thresholding');

HHni = Hni.*Hsni;
VVni = Vni.*Vsni;
Edgeni = sqrt(HHni+VVni);

figure, imshow(Edgeni), title('Edge before thresholding');

output = thres(HH,VV, Edge, H, Hs, V, Vs);
figure,imshow(output), title('Edge map of Peppers');

outputn = thres(HHn,VVn, Edgen, Hn, Hsn, Vn, Vsn);
figure, imshow(outputn), title('Edge map of Peppers with Gaussian Noise');

outputni = thres(HHni,VVni, Edgeni, Hni, Hsni, Vni, Vsni);
figure, imshow(outputni), title('Edge map of Peppers with Impulse noise');
