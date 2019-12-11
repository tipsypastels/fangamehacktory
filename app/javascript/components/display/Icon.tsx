/** @jsx jsx */
import { jsx } from '@emotion/core';
import { HTMLProps, ReactNode } from 'react';

export type IconGroup = 'fal' | 'fas' | 'fab';
export type IconSource = string | [string, IconGroup];
export const DEFAULT_GROUP: IconGroup = 'fal';

type Props = {
  src: IconSource;
  fw?: boolean;
  mr?: string | number;
  className?: string;
}

export default function Icon({ src, fw, mr, ...props }: Props) {
  let name, group;
  if (Array.isArray(src)) {
    name = src[0];
    group = src[1];
  } else {
    name = src;
    group = DEFAULT_GROUP;
  }

  return (
    <i 
      className={`
        icon ${group} fa-${name}
        ${fw && 'fa-fw'}
      `}
      css={{ marginRight: mr }}
      {...props} 
    />
  );
}

Icon.defaultProps = {
  fw: true,
};