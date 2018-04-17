load('Data.mat')
%% Feature Extraction
pixelW = 0.6562;
sliceT = 2.5;
%--------FORMA---------%
volume = getVolume(CT.*mask,pixelW,sliceT); %Volume (mm^3)
solidity = getSolidity(CT.*mask,pixelW,sliceT); %Ratio = #voxelROI/#voxelPoliedro (compatto) 
size = getSize(CT.*mask,pixelW,sliceT); %longest diameter
eccentricity = getEccentricity(CT.*mask,pixelW,sliceT); % E = 0; circonferenza E >> 0 diventa ellisse
%--------TEXTURE---------%
[ROIonly,levels] = prepareVolume(CT,mask,'Other',pixelW, ...
     sliceT,1,'pixelW','Matrix','Lloyd',128);
 GLCM = getGLCM(ROIonly,levels);
 textGLCM = getGLCMtextures(GLCM); % 1
 GLRLM = getGLRLM(ROIonly,levels);
 textGLRLM = getGLRLMtextures(GLRLM); % 2
 GLSZM = getGLSZM(ROIOnly,levels);
 textGLSZM = getGLSZMtextures(GLSZM); % 3
 [NGTDM,countValid] = getNGTDM(ROIOnly,levels);
 textNGTDM = getNGTDMtextures(NGTDM,countValid);
 [ROIonly,levels] = prepareVolume(CT,mask,'Other',pixelW, ...
     sliceT,1,'pixelW','Global');
  textGLOBAL = getGlobalTextures(ROIonly,Nbins); % 4
  %--------INTENSITA'---------%
  
  
  features = [volume solidity size eccentricity];