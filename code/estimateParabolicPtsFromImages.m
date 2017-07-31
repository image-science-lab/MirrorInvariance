clear all
close all


Surf = '../images/Surface1/Image%02d.png'; %%INPUT FOLDER
Surf = '../images/RecogExperiment/Image%02d.png'; %%INPUT FOLDER
imList = 1:25;  %%FILE NUMBERS

Ixx = 0;
Iyy = 0;
Ixy = 0;

[X,Y] = meshgrid(-10:10, -10:10);
fil = exp(-(X.^2+Y.^2)/(2)); fil = fil/sum(fil(:));
%
for i=imList
    disp(i)
    img = imread(sprintf(Surf, i));
    img = img(:,end:-1:1, :);
    img = double(img)/256;
    if (1)
        img = mean(img, 3);
        img = img/256;
    end

    for ch=1:size(img, 3)
        img_fil = conv2(img(:,:,ch), fil, 'valid');
        [Ix, Iy] = gradient(img_fil);

%        zIndx = (Ix.^2+Iy.^2) >= (10/2^16).^2;
%        Ix = Ix./sqrt(Ix.^2+Iy.^2);
%        Iy = Iy./sqrt(Ix.^2+Iy.^2);


        if (Ixx == 0)
            Ixx = 0*Ix;
            Iyy = 0*Ix;
            Ixy = 0*Ix;
        end
        
        Ixx = Ixx+Ix.*Ix;
        Iyy = Iyy+Iy.*Iy;
        Ixy = Ixy+Ix.*Iy;
        

%        Ixx(zIndx) = Ix(zIndx).*Ix(zIndx) + Ixx(zIndx);
%        Iyy(zIndx) = Iy(zIndx).*Iy(zIndx) + Iyy(zIndx);
%        Ixy(zIndx) = Ix(zIndx).*Iy(zIndx) + Ixy(zIndx);
    end
end

dt = Ixx.*Iyy - Ixy.^2;

A = 1+0*Ixx;
B = -(Ixx+Iyy);
C = (Ixx.*Iyy - Ixy.^2);
E1 = (-B + sqrt(B.^2-4*A.*C))./(2*A);
E2 = (-B - sqrt(B.^2-4*A.*C))./(2*A);

E1 = eps+abs(E1);
E2 = eps+abs(E2);
subplot 221
imagesc(log10(E1)); title('Larger eigenvalue');
subplot 222
imagesc(log10(E2)); title('Smaller eigenvalue');
subplot 223
imagesc(log10(eps+abs(dt))); title('product');
subplot 224
imagesc(log10(E1./(1e-10+E2))); title('Ratio of eigs')


