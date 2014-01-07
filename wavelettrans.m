%Code By Hariharan Kumar
function [app,H,V,D,app1,H1,V1,D1,app2,H2,V2,D2,app3,H3,V3,D3] = wavelettrans(img1,l,h)


app = conv2(l,l,img1,'same');
H = conv2(l,h,img1,'same');
V = conv2(h,l,img1,'same');
D = conv2(h,h,img1,'same');
app = imresize(app,0.5);
H = imresize(H,0.5);
V = imresize(V,0.5);
D = imresize(D,0.5);


app1 = conv2(l,l,app,'same');
H1 = conv2(l,h,app,'same');
V1 = conv2(h,l,app,'same');
D1 = conv2(h,h,app,'same');
app1 = imresize(app1,0.5);
H1 = imresize(H1,0.5);
V1 = imresize(V1,0.5);
D1 = imresize(D1,0.5);

app2 = conv2(l,l,app1,'same');
H2 = conv2(l,h,app1,'same');
V2 = conv2(h,l,app1,'same');
D2 = conv2(h,h,app1,'same');
app2 = imresize(app2,0.5);
H2 = imresize(H2,0.5);
V2 = imresize(V2,0.5);
D2 = imresize(D2,0.5);


app3 = conv2(l,l,app2,'same');
H3 = conv2(l,h,app2,'same');
V3 = conv2(h,l,app2,'same');
D3 = conv2(h,h,app2,'same');
app3 = imresize(app2,0.5);
H3 = imresize(H3,0.5);
V3 = imresize(V3,0.5);
D3 = imresize(D3,0.5);