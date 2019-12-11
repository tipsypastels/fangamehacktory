/** @jsx jsx */
import { jsx, css } from '@emotion/core';
import { Link } from 'react-router-dom';
import Subject from '../types/Subject';
import Row from './display/Row';
import Font from './display/Font';
import Raw from './Raw';
import Unread from './display/Unread';
import Avatar from './display/Avatar';
import Icon from './display/Icon';
import { Suspense } from 'react';
import Time from './display/Time';

export default function SubjectListing(subject: Subject) {
  return (
    <Link to={subject.path} css={css`
      display: block;
      padding: 0.25rem;
      box-sizing: border-box;
      border-radius: 8px;

      &:not(:last-child) {
        margin-bottom: 0.5rem;
        padding-bottom: 0.5rem;
        border-bottom: 1px solid var(--divider-color);
      }

      &:hover {
        background-color: var(--highlight-color);
      }
    `}>
      <Row center="vertical" gutters="10px">
        <Row.Column>
          <Avatar
            src={subject.avatar_url}
            size="smallish"
            status={subject.status_icon}
          />
        </Row.Column>

        <Row.Column expand>
          <Font face="title">
            {subject.title}
            <Unread
              color={subject.subjected.css_class} 
              if={subject.unread} 
            />
          </Font>

          <div>
            <Font color={subject.subjected.css_class}>
              <Icon src={[subject.latest_event.icon, 'fas']} />
            </Font>

            <Raw html={subject.latest_event.label} /> <Font color="secondary-text"><Time stamp={subject.latest_event.created_at}/></Font>
          </div>
        </Row.Column>
      </Row>
    </Link>
  );
}