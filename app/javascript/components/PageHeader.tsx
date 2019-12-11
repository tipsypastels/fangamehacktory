/** @jsx jsx */
import { jsx, css } from '@emotion/core';
import Row from './display/Row';
import { Link } from 'react-router-dom';
import Font from './display/Font';
import { useContext } from 'react';
import { AppContext } from './App';
import HeaderLink from './display/HeaderLink';

export default function PageHeader() {
  const [{ currentUser }] = useContext(AppContext);

  return (
    <Row css={css`
      margin: 3rem 0.5rem;
    `}>
      <Row.Column expand css={css`
        letter-spacing: 2px;
      `}>
        <Font face="display" color="primary">
          <Link to="/">
            Fangame Hacktory
          </Link>
        </Font>
      </Row.Column>

      <Row.Column>
        <HeaderLink to="/">Home</HeaderLink>
        <HeaderLink to="/explore">Explore</HeaderLink>
        <HeaderLink to="/faq">FAQ</HeaderLink>
        
        <HeaderLink to="/you" if={currentUser}>
          You
        </HeaderLink>
      </Row.Column>
    </Row>
  );
}