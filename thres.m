function output =  thres(HH, VV, Edge, H, Hs, V, Vs)


angle_array=zeros(256,256);

for i=1:255;
    for j=1:255
        p=atan(VV(i,j)/HH(i,j))*180/pi;  
        angle_array(i,j)=p; 
    end
end;


edge_array=zeros(256,256);

Grads = Edge;
%figure, imshow(Edge);

for i=2:255
    for j=2:255
        if ((angle_array(i,j)>=(-22.5) && angle_array(i,j)<=22.5) ||(angle_array(i,j)>=(180-22.5) && angle_array(i,j)<=(180+22.5)))     %  0/180
            if (Grads(i,j)>Grads(i+1,j) && Grads(i,j)>Grads(i-1,j))
                edge_array(i,j)=Grads(i,j);
            end
        elseif ((angle_array(i,j)>=(90-22.5) && angle_array(i,j)<=(90+22.5))||(angle_array(i,j)>=(270-22.5) && angle_array(i,j)<=(270+22.5))) %  90/270
            if (Grads(i,j)>Grads(i,j+1) && Grads(i,j)>Grads(i,j-1))
                edge_array(i,j)=Grads(i,j);
            end
        elseif ((angle_array(i,j)>=(45-22.5) && angle_array(i,j)<=(45+22.5))||(angle_array(i,j)>=(225-22.5) && angle_array(i,j)<=(225+22.5))) %  45/225
            if (Grads(i,j)>Grads(i+1,j+1) && Grads(i,j)>Grads(i-1,j-1))
                edge_array(i,j)=Grads(i,j);
            end
         else 
             if (Grads(i,j)>Grads(i+1,j-1) && Grads(i,j)>Grads(i-1,j+1))
                 edge_array(i,j)=Grads(i,j);
             end
         end
    end
end

%figure, imshow(edge_array);
%disp(edge_array);
aaa = max(max(edge_array));
sc1 = sqrt(norm(H))*sqrt(norm(V));
sc2 = sqrt(norm(Hs))*sqrt(norm(Vs));
sc = 0.8 * 30 * sc1*sc2 * sqrt(2);
edge_array = edge_array/aaa;
%figure, imshow(edge_array);
...disp(T);

for i=1:256
    for j=1:256
        if(edge_array(i,j) > 0.19)
            output(i,j)=1;
        else
            output(i,j)=0;
        end;
    end;
end;

output = imresize(output,2);
