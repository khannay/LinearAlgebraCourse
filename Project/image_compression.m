R=imread('mona.png');
R=double(R);
redchannel=R(:,:,1);
greenchannel=R(:,:,2);
bluechannel=R(:,:,3);
R1=.299*redchannel + .587*greenchannel + .114*bluechannel;
[U,S,V]=svd(R1);
num=2;
threshold=S(num,num); %set the threshold
S(S<threshold)=0.0

figure
colormap(gray)
subplot(1,2,1)       % add first plot in 1 x 2 grid
imagesc(R1)     % plot using + markers
title('Original Image')
axis off;


subplot(1,2,2)       % add second plot in 1 x 2 grid
imagesc(U*S*V')
axis off;
title('SVD Image')



