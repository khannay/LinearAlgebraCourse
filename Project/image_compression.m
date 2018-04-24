function [R1,C]=image_compression(filename, components=10, show=1)
%Define a function to perform image compression on a given image
% specified as with the filename
% C=image_compression(filename, components=10, show=1)
%set show to 0 to no plot the results in grayscale
%the components tells how many of the singular values to use 



R=imread(filename);
R=double(R);
%If this is rgb image then grayscale it
if (length(size(R))==3)
  redchannel=R(:,:,1);
  greenchannel=R(:,:,2);
  bluechannel=R(:,:,3);
  R1=.299*redchannel + .587*greenchannel + .114*bluechannel;
 else
  R1=R;
 end
 dimensions=size(R1)
  
[U,S,V]=svd(R1);
num=components;
threshold=S(num,num); %set the threshold
S(S<threshold)=0.0;

C=U*S*V';

if (show==1)
  figure
  colormap(gray)
  %subplot(1,2,1)       % add first plot in 1 x 2 grid
  imagesc(R1)     % plot using + markers
  title('Original Image')
  axis off;


  figure
  colormap(gray)
  %subplot(1,2,2)       % add second plot in 1 x 2 grid
  imagesc(C)
  axis off;
  title('SVD Image')
end

%Print the compression ratio
mydim=size(R);
compress_percentage=100*(sum(size(R))*components)/(mydim(1)*mydim(2)) 

endfunction

