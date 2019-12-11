/** @jsx jsx */
import { jsx, css } from '@emotion/core';
import { HTMLProps } from 'react';

interface Props extends HTMLProps<HTMLDivElement> {
  spacing: string | number;
}

export default function Stack({ spacing, ...props }: Props) {
  return (
    <div 
      css={css`
        display: flex;
        flex-direction: column;
        align-items: center;

        & > *:not(:last-child) {
          margin-bottom: ${spacing}
        }
      `}
      {...props}
    />
  );
}

Stack.defaultProps = {
  spacing: '0.5rem',
};