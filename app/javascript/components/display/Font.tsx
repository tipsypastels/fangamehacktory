/** @jsx jsx */
import { jsx, css } from '@emotion/core';
import { HTMLProps } from 'react';

function variableize(color: string) {
  if (color.startsWith('#')) {
    return color;
  }

  return `var(--${color}-color)`;
}

const FONT_FACES = {
  display: css`
    font-family: Comfortaa;
    text-transform: uppercase;
  `,
  title: css`
    color: var(--primary-color);
    font-size: 1.1rem;
    font-weight: 500;
  `,
  h1: css`
    font-size: 2.5rem;
    font-weight: bold;
    margin-bottom: 0.75rem;
    display: block;
  `,
  h2: css`
    font-size: 1.7rem;
    font-weight: bold;
    margin-bottom: 0.75rem;
    display: block;
  `,
};

export type FontFace = keyof typeof FONT_FACES;

interface Props extends HTMLProps<HTMLSpanElement> {
  face?: FontFace | FontFace[];
  color?: string;
  activeColor?: string;
  active?: boolean;
}

export default function Font({ face, color, activeColor, active, ...props }: Props) {
  let cssLiteral = {};
  if (face) {
    cssLiteral = Array.isArray(face)
      ? face.reduce((p, c) => ({ ...p, ...FONT_FACES[c] }), {})
      : FONT_FACES[face];
  }

  if (color) {
    cssLiteral = css`
      ${cssLiteral}
      color: ${variableize(color)};
    `;
  }

  if (activeColor) {
    cssLiteral = css`
      ${cssLiteral}
      &:hover, &.active, .active & {
        color: ${variableize(activeColor)};
      }
    `;
  }

  return (
    <span
      className={active && 'active'}
      css={cssLiteral}
      {...props}
    />
  );
}