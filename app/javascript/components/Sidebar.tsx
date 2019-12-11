/** @jsx jsx */
import { jsx, css } from '@emotion/core';
import { HTMLProps, ReactNode } from 'react';
import { NavLink } from 'react-router-dom';
import Font from './display/Font';
import Icon, { IconSource } from './display/Icon';
import Row from './display/Row';

type Props = HTMLProps<HTMLDivElement>;

export default function Sidebar(props: Props) {
  return (
    <div css={{ width: 300 }} {...props} />
  );
}

Sidebar.Action = SidebarAction;

interface ActionProps extends HTMLProps<HTMLDivElement> {
  children: ReactNode;
  to: string;
  icon: IconSource;
  color?: string;
}

export function SidebarAction({ children, to, icon, color, ...props }: ActionProps) {
  return (
    <NavLink 
      exact to={to}
      isActive={(_, { pathname, search }) => {
        return pathname + search === to;
      }}
    >
      <Row center="vertical" css={css`
        display: block;
        padding: 8px;
        border-radius: 4px;
        margin-bottom: 4px;
      `} {...props}>
        <Font color={color}>
          <Icon src={icon} mr="8px" />
        </Font>

        <Font activeColor="primary">
          {children}
        </Font>
      </Row>
    </NavLink>
  );
}