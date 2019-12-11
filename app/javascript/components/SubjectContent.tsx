/** @jsx jsx */
import { jsx } from '@emotion/core';
import Raw from './Raw';
import SubjectEditor from './SubjectEditor';
import Subject from '../types/Subject';

type Props = {
  subject: Subject;
  editing?: boolean;
};

export default function SubjectContent({ subject, editing }: Props) {
  if (editing) {
    return <SubjectEditor subject={subject} />
  }

  // TODO widgets
  return <Raw html={subject.content} />;
}

SubjectContent.defaultProps = {
  editing: false,
};