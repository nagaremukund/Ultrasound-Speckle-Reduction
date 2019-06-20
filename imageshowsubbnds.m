for i=1:7
subplot(3,3,i)
imshow(X_DirSubBands{1, 1}{1, 2}{1, i},[])
end
figure
for i=1:7
subplot(3,3,i)
imshow(X_DirSubBands{1, 2}{1, 2}{1, i},[])
end
figure
for i=1:7
subplot(3,3,i)
imshow(X_DirSubBands{1, 3}{1, 2}{1, i},[])
end
for i=1:4
subplot(3,3,i)
imshow(X_DirSubBands{1, 1}{1, 1}{1, i},[])
end
figure
for i=1:4
subplot(3,3,i)
imshow(X_DirSubBands{1, 2}{1, 1}{1, i},[])
end
figure
for i=1:4
subplot(3,3,i)
imshow(X_DirSubBands{1, 3}{1, 1}{1, i},[])
end