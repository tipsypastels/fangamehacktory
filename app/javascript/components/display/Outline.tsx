/** @jsx jsx */
import { jsx, css } from '@emotion/core';
import { HTMLProps } from 'react';

interface Props extends HTMLProps<HTMLDivElement> {
  color: string;
}

export default function Outline({ color, ...props }: Props) {
  return (
    <div 
      css={css`
        border: 4px solid var(--${color}-color);
        border-radius: 20px;
        padding: 0.5rem 1rem;
        margin: 1rem 0;
      `}
      {...props}
    />
  );
}