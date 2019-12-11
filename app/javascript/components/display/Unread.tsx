/** @jsx jsx */
import { jsx, css } from '@emotion/core';
import Background from './Background';

type Props = {
  color: string;
  if?: any;
}

export default function Unread(props: Props) {
  if ('if' in props && !props.if) {
    return null;
  }

  return (
    <Background color={props.color} css={css`
      display: inline-block;
      width: 8px;
      height: 8px;
      border-radius: 50%;
      margin: 0 0.5rem;
    `} />
  );
}