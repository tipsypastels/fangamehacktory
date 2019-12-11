/** @jsx jsx */
import { jsx } from '@emotion/core';
import { HTMLProps } from 'react';

interface Props extends HTMLProps<HTMLDivElement> {
  width?: string;
  expand?: boolean;
}

export default function Column({ width, expand, ...props }: Props) {
  return (
    <div 
      css={{
        width,
        flexGrow: expand ? 1 : 'unset',
        '&:not(:last-child)': {
          marginRight: 'var(--gutters)',
        },
      }}
      {...props}
    />
  );
}