/** @jsx jsx */
import { jsx } from '@emotion/core';
import { HTMLProps } from 'react';

interface Props extends HTMLProps<HTMLDivElement> {
  color?: string;
}

export default function Background({ color, ...props }: Props) {
  return (
    <div 
      css={{
        backgroundColor: `var(--${color}-color)`,
      }}
      {...props} 
    />
  );
}