import React, { ReactNode } from 'react';

type Props = {
  html: string;
}

export default function Raw({ html: __html }: Props) {
  return (
    <span dangerouslySetInnerHTML={{ __html }} />
  );
}
