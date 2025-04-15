function h5conv2tiff(filename)
entry = '/entry/data/data';
R = h5read(filename, entry);
R = R';
[filepath,name,~] = fileparts(filename);
if isempty(filepath)
    filepath = pwd;
end
filename = fullfile(filepath, filesep, [name, '.tif']);
maxVal = max(R(:));
if maxVal <= 65535
    bitDepth = 16;
elseif maxVal <= 16777215
    bitDepth = 24;
else
    bitDepth = 32;
end
imwritetiff(R, filename, bitDepth)
