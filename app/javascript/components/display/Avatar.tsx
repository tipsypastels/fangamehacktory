/** @jsx jsx */
import { jsx, css } from '@emotion/core';
import StatusIcon from '../../types/StatusIcon';
import Background from './Background';
import Icon from './Icon';

const AVATAR_SIZES = {
  small: 32,
  smallish: 42,
  large: 100,
  huge: 250,
};

export type AvatarSize = keyof typeof AVATAR_SIZES;

type Props = {
  src: string;
  size: AvatarSize,
  status?: StatusIcon;
  shape?: 'circle' | 'square';
}

export default function Avatar(props: Props) {
  const size = AVATAR_SIZES[props.size];

  return (
    <div css={css`position: relative`}>
      <img src={props.src} css={css`
        ${props.shape === 'circle' && 'border-radius: 50%;'}
        width: ${size}px;
        height: ${size}px;
      `} />

      {(() => {
        if (props.status) return (
          <Background 
            color={props.status.slug} 
            title={props.status.name}
            css={css`
            position: absolute;
            bottom: 0;
            right: -5px;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            color: white;
            font-size: 0.85rem;
            display: flex;
            align-items: center;
            justify-content: center;
          `}>
            <Icon src={[props.status.icon, 'fas']} />
          </Background>
        )
      })()}
    </div>
  );
}

Avatar.defaultProps = {
  shape: 'circle',
};