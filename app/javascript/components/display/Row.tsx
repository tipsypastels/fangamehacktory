/** @jsx jsx */
import { jsx } from '@emotion/core';
import { HTMLProps } from 'react';
import Column from './Column';

interface Props extends HTMLProps<HTMLDivElement> {
  gutters?: string; // TODO standard units for this
  center?: 'both' | 'vertical' | 'horizontal'; 
}

const CENTERING_CSS_PROPS = {
  both: { alignItems: 'center', justifyContent: 'center' },
  horizontal: { justifyContent: 'center' },
  vertical: { alignItems: 'center' }, 
};

export default function Row({ gutters, center, ...props }: Props) {
  return (
    <div 
      css={{
        display: 'flex',
        ...CENTERING_CSS_PROPS[center],
        '--gutters': gutters,
      }} 
      {...props}
    />
  );
}

Row.defaultProps = {
  gutters: '8px',
};

Row.Column = Column;