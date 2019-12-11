/** @jsx jsx */
import { jsx, css } from '@emotion/core';
import Subject from '../types/Subject';
import Avatar from './display/Avatar';
import Font from './display/Font';
import Row from './display/Row';
import Time from './display/Time';
import { Fragment } from 'react';

export default function SubjectInfobox(subject: Subject) {
  return (
    <Row center="vertical" css={css`
      border-top: 1px solid var(--dark-highlight-color);
      border-bottom: 1px solid var(--dark-highlight-color);
      margin: 1rem 0;
      padding: 0.5rem 1rem;
    `}>
      <Row.Column>
        <Avatar
          src={subject.avatar_url}
          size="smallish"
        />
      </Row.Column>

      <Row.Column expand>
        <div>
          <Font color={subject.subjected.css_class}>{subject.subjected.human_name}</Font> {subject.status_icon && <Font color={subject.status_icon.slug}>({subject.status_icon.name})</Font>} by {subject.credit}
        </div>

        <div>
          <Font color="secondary-text">
            <Time stamp={subject.created_at} />

            {subject.latest_event.action !== 'created' && (
              <Fragment>
                , updated <Time stamp={subject.latest_event.created_at} />)
              </Fragment>
            )}
          </Font>
        </div>
      </Row.Column>
    </Row>
  );
}