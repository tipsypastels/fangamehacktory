/** @jsx jsx */
import { jsx } from '@emotion/core';
import styled from '@emotion/styled';
import { ReactNode, FC, Component } from 'react';
import PageHeader from './PageHeader';
import Sidebar from './Sidebar';

export const PageLayout = styled.div`
  width: 1100px;
  max-width: 100%;
  margin: auto;
  display: flex;
  flex-direction: column;
  min-height: 100vh;
`;

export const PageMain = styled.div`
  flex-grow: 1;
  display: flex;
`;

export const PageMainContent = styled.div`
  flex-grow: 1;
  display: flex;
  flex-direction: column;
`;

export const Paper = styled.div`
  flex-grow: 1;
  background-color: var(--highlight-color);
  margin: 0 2rem;
  padding: 2rem 4rem;
  position: relative;

  &::after {
    content: '';
    position: absolute;
    top: 10px;
    right: -8px;
    width: 8px;
    height: calc(100% - 10px);
    background-color: var(--dark-highlight-color);
    z-index: 9999;
  }
`;

type Props = {
  paper?: boolean;
  footer?: boolean;
  className?: string;
  children: ReactNode;
  sidebar?: ReactNode;
};

export default function Page(props: Props) {
  const children = props.paper
    ? <Paper>{props.children}</Paper>
    : props.children;

  const sidebar = props.sidebar
    ? <Sidebar>{props.sidebar}</Sidebar>
    : null;

  const footer = props.footer
    ? <div>footer here</div>
    : null;

  return (
    <PageLayout>
      <PageHeader />

      <PageMain>
        {sidebar}

        <PageMainContent>
          {children}
        </PageMainContent>
      </PageMain>

      {footer}
    </PageLayout>
  );
}

Page.defaultProps = {
  paper: false,
  footer: true,
};