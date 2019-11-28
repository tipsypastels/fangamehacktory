import React, { useState, useRef } from 'react';
import { DirectUpload } from '@rails/activestorage';
import ReactCrop from 'react-image-crop';
import 'react-image-crop/dist/ReactCrop.css';

type Props = {
  name: string;
  label: string;
  aspect: { width: number, height: number };
  scope: string;
  current?: string;
  buttonClassName?: string;
  directUpload: string;
};

type Crop = {
  unit: string;
  width?: number;
  height?: number;
  aspect: number;
};

export default function FileField(props: Props) {
  const [src, setSrc] = useState(null);
  const [croppedImageUrl, setCroppedImageUrl] = useState(null);
  const [signedId, setSignedId] = useState(null);
  const [cropping, setCropping] = useState(false);
  const [crop, setCrop] = useState<Crop>({
    unit: '%',
    width: 30,
    aspect: props.aspect.width / props.aspect.height,
  });

  const imageRef = useRef<any>(null);

  function onImageLoaded(image) {
    imageRef.current = image;
  }

  function onCropComplete(crop: Crop) {
    makeClientCrop(crop);
  }

  function onCropChange(crop: Crop, percentCrop: Crop) {
    setCrop(percentCrop);
  }

  async function makeClientCrop(crop: Crop) {
    if (imageRef.current && crop.width && crop.height) {
      const croppedImageUrl = await getCroppedImage(crop);
      setCroppedImageUrl(croppedImageUrl);
    }
  }

  function getCroppedImage(crop) {
    const image = imageRef.current;

    const canvas = document.createElement('canvas');
    const scaleX = image.naturalWidth / image.width;
    const scaleY = image.naturalHeight / image.height;
    
    canvas.width = crop.width;
    canvas.height = crop.height;

    const ctx = canvas.getContext('2d');

    ctx.drawImage(
      image,
      crop.x * scaleX,
      crop.y * scaleY,
      crop.width * scaleX,
      crop.height * scaleY,
      0,
      0,
      crop.width,
      crop.height,
    );

    return new Promise(resolve => {
      canvas.toBlob((blob: any) => {
        if (!blob) {
          console.error("Canvas is empty");
          return;
        }
        
        blob.name = 'image.jpeg';

        const file = new File([blob], blob.name, { type: blob.type });
        new DirectUpload(file, props.directUpload).create((error, { signed_id }) => {
          if (error) {
            console.error(error);
          } else {
            setSignedId(signed_id);
          }
        });

        resolve(window.URL.createObjectURL(blob));
      }, 'image/jpeg');
    });
  }

  function onSelectFile(e) {
    if (e.target.files && e.target.files[0]) {
      const reader = new FileReader();
      reader.addEventListener('load', () => {
        setSrc(reader.result);
        setCropping(true);
      });

      reader.readAsDataURL(e.target.files[0]);
    }
  }

  return (
    <div className="attr attr--file">
      <label className="attr--file__picker">
        <div className="attr__title">
          {props.name}
        </div>

        {(croppedImageUrl || props.current) && (
          <img
            alt={`Current ${props.name}`}
            src={croppedImageUrl || props.current}
            className="attr__preview"
          />
        )}
        
        <input type="file" onChange={onSelectFile} />
        <span className="link-color">{props.label}</span>
        
        {src && !cropping && (
          <React.Fragment>
            &nbsp;/&nbsp;

            <span className="link-color" onClick={e => {
              e.preventDefault();
              setCropping(true);
            }}>
              Change crop
            </span>
          </React.Fragment>
        )}
      </label>

      {src && cropping && (
        <div className="attr--file__crop">
          <ReactCrop
            src={src}
            crop={crop}
            ruleOfThirds
            onImageLoaded={onImageLoaded}
            onComplete={onCropComplete}
            onChange={onCropChange}
          />

          <div className="attr--file__crop__ar">
            Aspect ratio: {props.aspect.width} to {props.aspect.height}
          </div>

          {croppedImageUrl && (
            <div className="attr attr--controls attr--file__crop__confirm attr--no-border-top">
              <button className={props.buttonClassName} onClick={() => {
                setCropping(false);
              }}>
                Done
              </button>
            </div>
          )}
        </div>
      )}

      {signedId && (
        <input 
          type="hidden" 
          name={`${props.scope}[${props.name.toLowerCase()}]`} 
          value={signedId} 
        />
      )}
    </div>
  );
}