function imwritetiff(imdata, filename, bit)
% save data as a tiff file
% function imwritetiff(imdata, filename, bit)

t = Tiff(filename, 'w');
t.setTag('ImageLength',size(imdata,1));
t.setTag('ImageWidth', size(imdata,2));
%t.setTag('Photometric', Tiff.Photometric.MinIsBlack);
t.setTag('Photometric', Tiff.Photometric.MinIsWhite);
t.setTag('BitsPerSample', bit);
t.setTag('SamplesPerPixel', 1);
t.setTag('TileWidth', 128);
t.setTag('TileLength', 128);
%t.setTag('Compression', Tiff.Compression.JPEG);
t.setTag('PlanarConfiguration', Tiff.PlanarConfiguration.Chunky);
%t.setTag('Software', 'MATLAB');
switch bit
    case 16
        imdata = uint16(imdata);
    case 32
        t.setTag('SampleFormat',Tiff.SampleFormat.IEEEFP);
        imdata = single(imdata);
    case 64
        t.setTag('SampleFormat',Tiff.SampleFormat.IEEEFP);
        imdata = double(imdata);
    otherwise
        imdata = single(imdata);
end
t.write(imdata);
t.close();