/** @jsx jsx */
import { jsx, css } from '@emotion/core';
import { ReactNode } from 'react';
import { useRouteMatch } from 'react-router';
import { Link, NavLink } from 'react-router-dom';
import Font from './Font';

type Props = {
  to: string;
  children: ReactNode;
  if?: any;
};

export default function HeaderLink(props: Props) {
  if ('if' in props && !props.if) {
    return null;
  }

  const children = typeof props.children === 'function'
    ? props.children()
    : props.children;

  return (
    <NavLink exact to={props.to} css={css`
      &:not(:first-of-type) {
        padding-left: 0.25rem;
      }

      &:not(:last-child) {
        padding-right: 0.25rem;
      }
    `}>
      <Font 
        face="display"
        color="primary-text"
        activeColor="secondary-text" 
      >
        {children}
      </Font>
    </NavLink>
  );
}